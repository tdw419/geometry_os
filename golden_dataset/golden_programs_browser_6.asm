; DESCRIPTION: Geometry OS program to draw a colored object.

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
  LDI r12, 1

  ; Clear scroll offset
  LDI r1, 0
  LDI r2, SCROLL_OFF
  STORE r2, r1

  ; Clear loading flag
  LDI r2, LOADING_FLG
  STORE r2, r1

  ; Clear history pointer
  LDI r2, HIST_PTR
  STORE r2, r1

  ; Write default URL
  LDI r1, URL_BUF
  LDI r2, 108        ; 'l'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 111        ; 'o'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 99         ; 'c'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 97         ; 'a'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 108        ; 'l'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 104        ; 'h'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 111        ; 'o'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 115        ; 's'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 116        ; 't'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 58         ; ':'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 56         ; '8'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 48         ; '0'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 48         ; '0'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 48         ; '0'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 47         ; '/'
  STORE r1, r2
  ADD r1, r12
  LDI r2, 0          ; null
  STORE r1, r2

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r9, 0
  FILL r9

  ; Draw URL bar background (dark blue strip)
  LDI r1, 0
  LDI r2, URL_BAR_Y
  LDI r0, 256
  LDI r6, 10
  LDI r11, 0x000080   ; dark blue
  RECTF r1, r2, r0, r6, r11

  ; Draw "URL: " label
  LDI r1, 2
  LDI r2, URL_BAR_Y
  LDI r0, url_label
  LDI r6, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r1, r2, r0

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r1, 34
  LDI r2, URL_BAR_Y
  LDI r0, URL_BUF
  LDI r6, 0xFFFFFF   ; white
  TEXT r1, r2, r0

  ; Draw status bar background
  LDI r1, 0
  LDI r2, STATUS_Y
  LDI r0, 256
  LDI r6, 10
  LDI r11, 0x333333   ; dark gray
  RECTF r1, r2, r0, r6, r11

  ; Check loading flag
  LDI r0, LOADING_FLG
  LOAD r0, r0
  JNZ r0, draw_loading

  ; Draw status: show response code
  LDI r1, 2
  LDI r2, STATUS_Y
  LDI r0, status_idle
  LDI r6, 0xFFFF00   ; yellow
  TEXT r1, r2, r0
  JMP draw_status_done

draw_loading:
  LDI r1, 2
  LDI r2, STATUS_Y
  LDI r0, status_loading
  LDI r6, 0xFF8800   ; orange
  TEXT r1, r2, r0

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r1, CONTENT_Y  ; y position
  LDI r2, 0          ; line counter
  LDI r0, SCROLL_OFF
  LOAD r0, r0       ; scroll offset
  LDI r6, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r11, 32
  LDI r7, 0          ; char offset in body
scroll_skip:
  JZ r0, scroll_done
  ADD r7, r11         ; offset += 32
  SUB r0, r12          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r6 = BODY_BUF + r7 (body start with scroll)
  LDI r0, BODY_BUF
  ADD r0, r7
  MOV r6, r0

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r11, 28         ; max lines to draw
draw_line_loop:
  JZ r11, draw_content_done

  ; Check if we hit end of body
  LOAD r7, r6        ; char at current body pos
  JZ r7, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r1, 2           ; x = 2
  ; r1 = x, current r1 = y? No, we need to track y
  ; Use r2 for y (already set initially)
  TEXT r1, r1, r6

  ; Advance body pointer by 32 chars (line width)
  LDI r7, 32
  ADD r6, r7

  ; Move y down
  LDI r7, 8
  ADD r1, r7

  ; Decrement line counter
  SUB r11, r12
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r1             ; read key
  JZ r1, no_key

  ; Check for Enter (13) - fetch page
  LDI r2, 13
  CMP r1, r2
  JZ r13, fetch_page

  ; Check for 'b' (98) - go back
  LDI r2, 98
  CMP r1, r2
  JZ r13, go_back

  ; Check for Up arrow - scroll up
  LDI r2, 119         ; 'w' for up
  CMP r1, r2
  JZ r13, scroll_up

  ; Check for Down arrow - scroll down
  LDI r2, 115         ; 's' for down
  CMP r1, r2
  JZ r13, scroll_down

  ; Check for Escape - quit
  LDI r2, 27
  CMP r1, r2
  JZ r13, quit

  JMP no_key

scroll_up:
  LDI r1, SCROLL_OFF
  LOAD r1, r1
  JZ r1, no_key       ; already at top
  SUB r1, r12
  LDI r2, SCROLL_OFF
  STORE r2, r1
  JMP no_key

scroll_down:
  LDI r1, SCROLL_OFF
  LOAD r1, r1
  LDI r2, 50          ; max scroll
  CMP r1, r2
  BGE r13, no_key       ; at max
  ADD r1, r12
  LDI r2, SCROLL_OFF
  STORE r2, r1
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r1, 1
  LDI r2, LOADING_FLG
  STORE r2, r1

  ; Reset scroll
  LDI r1, 0
  LDI r2, SCROLL_OFF
  STORE r2, r1

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r1, 0
  LDI r2, LOADING_FLG
  STORE r2, r1

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r1, HIST_PTR
  LOAD r1, r1
  JZ r1, no_key       ; no history
  SUB r1, r12
  LDI r2, HIST_PTR
  STORE r2, r1

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
  LDI r12, 1

  ; Write mock page content to body buffer
  LDI r1, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r2, 71  ; G
  STORE r1, r2
  ADD r1, r12
  LDI r2, 101 ; e
  STORE r1, r2
  ADD r1, r12
  LDI r2, 111 ; o
  STORE r1, r2
  ADD r1, r12
  LDI r2, 109 ; m
  STORE r1, r2
  ADD r1, r12
  LDI r2, 101 ; e
  STORE r1, r2
  ADD r1, r12
  LDI r2, 116 ; t
  STORE r1, r2
  ADD r1, r12
  LDI r2, 114 ; r
  STORE r1, r2
  ADD r1, r12
  LDI r2, 121 ; y
  STORE r1, r2
  ADD r1, r12
  LDI r2, 32  ; (space)
  STORE r1, r2
  ADD r1, r12
  LDI r2, 79  ; O
  STORE r1, r2
  ADD r1, r12
  LDI r2, 83  ; S
  STORE r1, r2
  ADD r1, r12
  LDI r2, 32  ; (space)
  STORE r1, r2
  ADD r1, r12
  LDI r2, 66  ; B
  STORE r1, r2
  ADD r1, r12
  LDI r2, 114 ; r
  STORE r1, r2
  ADD r1, r12
  LDI r2, 111 ; o
  STORE r1, r2
  ADD r1, r12
  LDI r2, 119 ; w
  STORE r1, r2
  ADD r1, r12
  LDI r2, 115 ; s
  STORE r1, r2
  ADD r1, r12
  LDI r2, 101 ; e
  STORE r1, r2
  ADD r1, r12
  LDI r2, 114 ; r
  STORE r1, r2
  ADD r1, r12

  ; Null terminate
  LDI r2, 0
  STORE r1, r2

  ; Set body length
  LDI r1, BODY_LEN
  LDI r2, 20
  STORE r1, r2

  ; Set status = 200
  LDI r1, STATUS_CELL
  LDI r2, 200
  STORE r1, r2

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
