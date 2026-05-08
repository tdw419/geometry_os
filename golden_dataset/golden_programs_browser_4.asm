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
  LDI r5, 1

  ; Clear scroll offset
  LDI r9, 0
  LDI r2, SCROLL_OFF
  STORE r2, r9

  ; Clear loading flag
  LDI r2, LOADING_FLG
  STORE r2, r9

  ; Clear history pointer
  LDI r2, HIST_PTR
  STORE r2, r9

  ; Write default URL
  LDI r9, URL_BUF
  LDI r2, 108        ; 'l'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 111        ; 'o'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 99         ; 'c'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 97         ; 'a'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 108        ; 'l'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 104        ; 'h'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 111        ; 'o'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 115        ; 's'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 116        ; 't'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 58         ; ':'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 56         ; '8'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 48         ; '0'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 48         ; '0'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 48         ; '0'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 47         ; '/'
  STORE r9, r2
  ADD r9, r5
  LDI r2, 0          ; null
  STORE r9, r2

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r4, 0
  FILL r4

  ; Draw URL bar background (dark blue strip)
  LDI r9, 0
  LDI r2, URL_BAR_Y
  LDI r7, 256
  LDI r15, 10
  LDI r6, 0x000080   ; dark blue
  RECTF r9, r2, r7, r15, r6

  ; Draw "URL: " label
  LDI r9, 2
  LDI r2, URL_BAR_Y
  LDI r7, url_label
  LDI r15, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r9, r2, r7

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r9, 34
  LDI r2, URL_BAR_Y
  LDI r7, URL_BUF
  LDI r15, 0xFFFFFF   ; white
  TEXT r9, r2, r7

  ; Draw status bar background
  LDI r9, 0
  LDI r2, STATUS_Y
  LDI r7, 256
  LDI r15, 10
  LDI r6, 0x333333   ; dark gray
  RECTF r9, r2, r7, r15, r6

  ; Check loading flag
  LDI r7, LOADING_FLG
  LOAD r7, r7
  JNZ r7, draw_loading

  ; Draw status: show response code
  LDI r9, 2
  LDI r2, STATUS_Y
  LDI r7, status_idle
  LDI r15, 0xFFFF00   ; yellow
  TEXT r9, r2, r7
  JMP draw_status_done

draw_loading:
  LDI r9, 2
  LDI r2, STATUS_Y
  LDI r7, status_loading
  LDI r15, 0xFF8800   ; orange
  TEXT r9, r2, r7

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r9, CONTENT_Y  ; y position
  LDI r2, 0          ; line counter
  LDI r7, SCROLL_OFF
  LOAD r7, r7       ; scroll offset
  LDI r15, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r6, 32
  LDI r8, 0          ; char offset in body
scroll_skip:
  JZ r7, scroll_done
  ADD r8, r6         ; offset += 32
  SUB r7, r5          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r15 = BODY_BUF + r8 (body start with scroll)
  LDI r7, BODY_BUF
  ADD r7, r8
  MOV r15, r7

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r6, 28         ; max lines to draw
draw_line_loop:
  JZ r6, draw_content_done

  ; Check if we hit end of body
  LOAD r8, r15        ; char at current body pos
  JZ r8, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r9, 2           ; x = 2
  ; r9 = x, current r9 = y? No, we need to track y
  ; Use r2 for y (already set initially)
  TEXT r9, r9, r15

  ; Advance body pointer by 32 chars (line width)
  LDI r8, 32
  ADD r15, r8

  ; Move y down
  LDI r8, 8
  ADD r9, r8

  ; Decrement line counter
  SUB r6, r5
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r9             ; read key
  JZ r9, no_key

  ; Check for Enter (13) - fetch page
  LDI r2, 13
  CMP r9, r2
  JZ r10, fetch_page

  ; Check for 'b' (98) - go back
  LDI r2, 98
  CMP r9, r2
  JZ r10, go_back

  ; Check for Up arrow - scroll up
  LDI r2, 119         ; 'w' for up
  CMP r9, r2
  JZ r10, scroll_up

  ; Check for Down arrow - scroll down
  LDI r2, 115         ; 's' for down
  CMP r9, r2
  JZ r10, scroll_down

  ; Check for Escape - quit
  LDI r2, 27
  CMP r9, r2
  JZ r10, quit

  JMP no_key

scroll_up:
  LDI r9, SCROLL_OFF
  LOAD r9, r9
  JZ r9, no_key       ; already at top
  SUB r9, r5
  LDI r2, SCROLL_OFF
  STORE r2, r9
  JMP no_key

scroll_down:
  LDI r9, SCROLL_OFF
  LOAD r9, r9
  LDI r2, 50          ; max scroll
  CMP r9, r2
  BGE r10, no_key       ; at max
  ADD r9, r5
  LDI r2, SCROLL_OFF
  STORE r2, r9
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r9, 1
  LDI r2, LOADING_FLG
  STORE r2, r9

  ; Reset scroll
  LDI r9, 0
  LDI r2, SCROLL_OFF
  STORE r2, r9

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r9, 0
  LDI r2, LOADING_FLG
  STORE r2, r9

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r9, HIST_PTR
  LOAD r9, r9
  JZ r9, no_key       ; no history
  SUB r9, r5
  LDI r2, HIST_PTR
  STORE r2, r9

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
  LDI r5, 1

  ; Write mock page content to body buffer
  LDI r9, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r2, 71  ; G
  STORE r9, r2
  ADD r9, r5
  LDI r2, 101 ; e
  STORE r9, r2
  ADD r9, r5
  LDI r2, 111 ; o
  STORE r9, r2
  ADD r9, r5
  LDI r2, 109 ; m
  STORE r9, r2
  ADD r9, r5
  LDI r2, 101 ; e
  STORE r9, r2
  ADD r9, r5
  LDI r2, 116 ; t
  STORE r9, r2
  ADD r9, r5
  LDI r2, 114 ; r
  STORE r9, r2
  ADD r9, r5
  LDI r2, 121 ; y
  STORE r9, r2
  ADD r9, r5
  LDI r2, 32  ; (space)
  STORE r9, r2
  ADD r9, r5
  LDI r2, 79  ; O
  STORE r9, r2
  ADD r9, r5
  LDI r2, 83  ; S
  STORE r9, r2
  ADD r9, r5
  LDI r2, 32  ; (space)
  STORE r9, r2
  ADD r9, r5
  LDI r2, 66  ; B
  STORE r9, r2
  ADD r9, r5
  LDI r2, 114 ; r
  STORE r9, r2
  ADD r9, r5
  LDI r2, 111 ; o
  STORE r9, r2
  ADD r9, r5
  LDI r2, 119 ; w
  STORE r9, r2
  ADD r9, r5
  LDI r2, 115 ; s
  STORE r9, r2
  ADD r9, r5
  LDI r2, 101 ; e
  STORE r9, r2
  ADD r9, r5
  LDI r2, 114 ; r
  STORE r9, r2
  ADD r9, r5

  ; Null terminate
  LDI r2, 0
  STORE r9, r2

  ; Set body length
  LDI r9, BODY_LEN
  LDI r2, 20
  STORE r9, r2

  ; Set status = 200
  LDI r9, STATUS_CELL
  LDI r2, 200
  STORE r9, r2

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
