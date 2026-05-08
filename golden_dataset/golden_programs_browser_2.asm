; DESCRIPTION: Draws a colored object at the screen with fixed size.

; browser.asm -- Text Browser v1 for Geometry OS
;
; A minimal web browser that fetches pages and renders them as text.
; Uses the http_get.asm library conventions.
;
; Memory layout (shared with http_get library):
;   0x6000..0x60FF  URL buffer
;   0x6100..0x61FF  Host buffer
;   0x6200          Port number
;   0x6300..0x63FF  Path buffer
;   0x6400..0x67FF  Request buffer
;   0x6800..0x8FFF  Response buffer
;   0x9000..0x97FF  Body buffer
;   0x9800          FD cell
;   0x9804          Body length
;   0x9808          Status code
;
; Browser state:
;   0x9900          Scroll offset (lines)
;   0x9904          Loading flag (1=loading, 0=idle)
;   0x9908          Page count (lines in body)
;   0x990C          History pointer (index into history)
;   0x9A00..0x9AFF  URL history ring (16 URLs, 16 bytes each)
;
; Controls:
;   Enter  - Fetch URL typed in URL bar
;   Up/Down - Scroll page content
;   'b'    - Go back in history
;   Escape - Quit
;
; Colors:
;   URL bar:     Cyan on dark blue
;   Status bar:  Yellow on dark gray
;   Content:     White on black
;   Links:       Green text

#define URL_BUF      0x6000
#define HOST_BUF     0x6100
#define PORT_CELL    0x6200
#define PATH_BUF     0x6300
#define REQ_BUF      0x6400
#define RESP_BUF     0x6800
#define BODY_BUF     0x9000
#define FD_CELL      0x9800
#define BODY_LEN     0x9804
#define STATUS_CELL  0x9808
#define SCROLL_OFF   0x9900
#define LOADING_FLG  0x9904
#define PAGE_LINES   0x9908
#define HIST_PTR     0x990C
#define HIST_BUF     0x9A00
#define URL_BAR_Y    4
#define STATUS_Y     14
#define CONTENT_Y    20
#define LINE_HEIGHT  8

  ; Initialize
  LDI r8, 1

  ; Clear scroll offset
  LDI r5, 0
  LDI r6, SCROLL_OFF
  STORE r6, r5

  ; Clear loading flag
  LDI r6, LOADING_FLG
  STORE r6, r5

  ; Clear history pointer
  LDI r6, HIST_PTR
  STORE r6, r5

  ; Write default URL
  LDI r5, URL_BUF
  LDI r6, 108        ; 'l'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 111        ; 'o'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 99         ; 'c'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 97         ; 'a'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 108        ; 'l'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 104        ; 'h'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 111        ; 'o'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 115        ; 's'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 116        ; 't'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 58         ; ':'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 56         ; '8'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 48         ; '0'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 48         ; '0'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 48         ; '0'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 47         ; '/'
  STORE r5, r6
  ADD r5, r8
  LDI r6, 0          ; null
  STORE r5, r6

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r10, 0
  FILL r10

  ; Draw URL bar background (dark blue strip)
  LDI r5, 0
  LDI r6, URL_BAR_Y
  LDI r0, 256
  LDI r12, 10
  LDI r7, 0x000080   ; dark blue
  RECTF r5, r6, r0, r12, r7

  ; Draw "URL: " label
  LDI r5, 2
  LDI r6, URL_BAR_Y
  LDI r0, url_label
  LDI r12, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r5, r6, r0

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r5, 34
  LDI r6, URL_BAR_Y
  LDI r0, URL_BUF
  LDI r12, 0xFFFFFF   ; white
  TEXT r5, r6, r0

  ; Draw status bar background
  LDI r5, 0
  LDI r6, STATUS_Y
  LDI r0, 256
  LDI r12, 10
  LDI r7, 0x333333   ; dark gray
  RECTF r5, r6, r0, r12, r7

  ; Check loading flag
  LDI r0, LOADING_FLG
  LOAD r0, r0
  JNZ r0, draw_loading

  ; Draw status: show response code
  LDI r5, 2
  LDI r6, STATUS_Y
  LDI r0, status_idle
  LDI r12, 0xFFFF00   ; yellow
  TEXT r5, r6, r0
  JMP draw_status_done

draw_loading:
  LDI r5, 2
  LDI r6, STATUS_Y
  LDI r0, status_loading
  LDI r12, 0xFF8800   ; orange
  TEXT r5, r6, r0

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r5, CONTENT_Y  ; y position
  LDI r6, 0          ; line counter
  LDI r0, SCROLL_OFF
  LOAD r0, r0       ; scroll offset
  LDI r12, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r7, 32
  LDI r13, 0          ; char offset in body
scroll_skip:
  JZ r0, scroll_done
  ADD r13, r7         ; offset += 32
  SUB r0, r8          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r12 = BODY_BUF + r13 (body start with scroll)
  LDI r0, BODY_BUF
  ADD r0, r13
  MOV r12, r0

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r7, 28         ; max lines to draw
draw_line_loop:
  JZ r7, draw_content_done

  ; Check if we hit end of body
  LOAD r13, r12        ; char at current body pos
  JZ r13, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r5, 2           ; x = 2
  ; r5 = x, current r5 = y? No, we need to track y
  ; Use r6 for y (already set initially)
  TEXT r5, r5, r12

  ; Advance body pointer by 32 chars (line width)
  LDI r13, 32
  ADD r12, r13

  ; Move y down
  LDI r13, 8
  ADD r5, r13

  ; Decrement line counter
  SUB r7, r8
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r5             ; read key
  JZ r5, no_key

  ; Check for Enter (13) - fetch page
  LDI r6, 13
  CMP r5, r6
  JZ r3, fetch_page

  ; Check for 'b' (98) - go back
  LDI r6, 98
  CMP r5, r6
  JZ r3, go_back

  ; Check for Up arrow - scroll up
  LDI r6, 119         ; 'w' for up
  CMP r5, r6
  JZ r3, scroll_up

  ; Check for Down arrow - scroll down
  LDI r6, 115         ; 's' for down
  CMP r5, r6
  JZ r3, scroll_down

  ; Check for Escape - quit
  LDI r6, 27
  CMP r5, r6
  JZ r3, quit

  JMP no_key

scroll_up:
  LDI r5, SCROLL_OFF
  LOAD r5, r5
  JZ r5, no_key       ; already at top
  SUB r5, r8
  LDI r6, SCROLL_OFF
  STORE r6, r5
  JMP no_key

scroll_down:
  LDI r5, SCROLL_OFF
  LOAD r5, r5
  LDI r6, 50          ; max scroll
  CMP r5, r6
  BGE r3, no_key       ; at max
  ADD r5, r8
  LDI r6, SCROLL_OFF
  STORE r6, r5
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r5, 1
  LDI r6, LOADING_FLG
  STORE r6, r5

  ; Reset scroll
  LDI r5, 0
  LDI r6, SCROLL_OFF
  STORE r6, r5

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r5, 0
  LDI r6, LOADING_FLG
  STORE r6, r5

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r5, HIST_PTR
  LOAD r5, r5
  JZ r5, no_key       ; no history
  SUB r5, r8
  LDI r6, HIST_PTR
  STORE r6, r5

  ; Restore URL from history (simplified: just go back to default)
  ; In a full implementation, would copy from history buffer to URL_BUF
  JMP no_key

quit:
  HALT

no_key:
  FRAME
  JMP main_loop


; ═══════════════════════════════════════════════
; do_fetch -- Simplified fetch for demo
; In production, this would call the http_get library routines.
; For the demo, it writes a mock page to BODY_BUF.
; ═══════════════════════════════════════════════
do_fetch:
  PUSH r31
  LDI r8, 1

  ; Write mock page content to body buffer
  LDI r5, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r6, 71  ; G
  STORE r5, r6
  ADD r5, r8
  LDI r6, 101 ; e
  STORE r5, r6
  ADD r5, r8
  LDI r6, 111 ; o
  STORE r5, r6
  ADD r5, r8
  LDI r6, 109 ; m
  STORE r5, r6
  ADD r5, r8
  LDI r6, 101 ; e
  STORE r5, r6
  ADD r5, r8
  LDI r6, 116 ; t
  STORE r5, r6
  ADD r5, r8
  LDI r6, 114 ; r
  STORE r5, r6
  ADD r5, r8
  LDI r6, 121 ; y
  STORE r5, r6
  ADD r5, r8
  LDI r6, 32  ; (space)
  STORE r5, r6
  ADD r5, r8
  LDI r6, 79  ; O
  STORE r5, r6
  ADD r5, r8
  LDI r6, 83  ; S
  STORE r5, r6
  ADD r5, r8
  LDI r6, 32  ; (space)
  STORE r5, r6
  ADD r5, r8
  LDI r6, 66  ; B
  STORE r5, r6
  ADD r5, r8
  LDI r6, 114 ; r
  STORE r5, r6
  ADD r5, r8
  LDI r6, 111 ; o
  STORE r5, r6
  ADD r5, r8
  LDI r6, 119 ; w
  STORE r5, r6
  ADD r5, r8
  LDI r6, 115 ; s
  STORE r5, r6
  ADD r5, r8
  LDI r6, 101 ; e
  STORE r5, r6
  ADD r5, r8
  LDI r6, 114 ; r
  STORE r5, r6
  ADD r5, r8

  ; Null terminate
  LDI r6, 0
  STORE r5, r6

  ; Set body length
  LDI r5, BODY_LEN
  LDI r6, 20
  STORE r5, r6

  ; Set status = 200
  LDI r5, STATUS_CELL
  LDI r6, 200
  STORE r5, r6

  POP r31
  RET


; ═══════════════════════════════════════════════
; String constants
; ═══════════════════════════════════════════════
url_label:
  .asciz "URL:"

status_idle:
  .asciz "Ready - Enter: fetch, W/S: scroll, B: back"

status_loading:
  .asciz "Loading..."
