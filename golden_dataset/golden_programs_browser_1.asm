; DESCRIPTION: This GeOS assembly code implements a minimal text-based web browser capable of fetching and rendering HTML pages as plain text. It utilizes defined memory segments for various buffers and state variables, including URL, host, port, path, request, response, body, and status information. The browser supports basic navigation controls such as entering URLs, scrolling content, navigating history, and quitting the application.

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
  LDI r11, 1

  ; Clear scroll offset
  LDI r7, 0
  LDI r3, SCROLL_OFF
  STORE r3, r7

  ; Clear loading flag
  LDI r3, LOADING_FLG
  STORE r3, r7

  ; Clear history pointer
  LDI r3, HIST_PTR
  STORE r3, r7

  ; Write default URL
  LDI r7, URL_BUF
  LDI r3, 108        ; 'l'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 111        ; 'o'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 99         ; 'c'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 97         ; 'a'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 108        ; 'l'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 104        ; 'h'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 111        ; 'o'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 115        ; 's'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 116        ; 't'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 58         ; ':'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 56         ; '8'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 48         ; '0'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 48         ; '0'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 48         ; '0'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 47         ; '/'
  STORE r7, r3
  ADD r7, r11
  LDI r3, 0          ; null
  STORE r7, r3

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r12, 0
  FILL r12

  ; Draw URL bar background (dark blue strip)
  LDI r7, 0
  LDI r3, URL_BAR_Y
  LDI r2, 256
  LDI r1, 10
  LDI r8, 0x000080   ; dark blue
  RECTF r7, r3, r2, r1, r8

  ; Draw "URL: " label
  LDI r7, 2
  LDI r3, URL_BAR_Y
  LDI r2, url_label
  LDI r1, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r7, r3, r2

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r7, 34
  LDI r3, URL_BAR_Y
  LDI r2, URL_BUF
  LDI r1, 0xFFFFFF   ; white
  TEXT r7, r3, r2

  ; Draw status bar background
  LDI r7, 0
  LDI r3, STATUS_Y
  LDI r2, 256
  LDI r1, 10
  LDI r8, 0x333333   ; dark gray
  RECTF r7, r3, r2, r1, r8

  ; Check loading flag
  LDI r2, LOADING_FLG
  LOAD r2, r2
  JNZ r2, draw_loading

  ; Draw status: show response code
  LDI r7, 2
  LDI r3, STATUS_Y
  LDI r2, status_idle
  LDI r1, 0xFFFF00   ; yellow
  TEXT r7, r3, r2
  JMP draw_status_done

draw_loading:
  LDI r7, 2
  LDI r3, STATUS_Y
  LDI r2, status_loading
  LDI r1, 0xFF8800   ; orange
  TEXT r7, r3, r2

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r7, CONTENT_Y  ; y position
  LDI r3, 0          ; line counter
  LDI r2, SCROLL_OFF
  LOAD r2, r2       ; scroll offset
  LDI r1, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r8, 32
  LDI r0, 0          ; char offset in body
scroll_skip:
  JZ r2, scroll_done
  ADD r0, r8         ; offset += 32
  SUB r2, r11          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r1 = BODY_BUF + r0 (body start with scroll)
  LDI r2, BODY_BUF
  ADD r2, r0
  MOV r1, r2

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r8, 28         ; max lines to draw
draw_line_loop:
  JZ r8, draw_content_done

  ; Check if we hit end of body
  LOAD r0, r1        ; char at current body pos
  JZ r0, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r7, 2           ; x = 2
  ; r7 = x, current r7 = y? No, we need to track y
  ; Use r3 for y (already set initially)
  TEXT r7, r7, r1

  ; Advance body pointer by 32 chars (line width)
  LDI r0, 32
  ADD r1, r0

  ; Move y down
  LDI r0, 8
  ADD r7, r0

  ; Decrement line counter
  SUB r8, r11
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r7             ; read key
  JZ r7, no_key

  ; Check for Enter (13) - fetch page
  LDI r3, 13
  CMP r7, r3
  JZ r5, fetch_page

  ; Check for 'b' (98) - go back
  LDI r3, 98
  CMP r7, r3
  JZ r5, go_back

  ; Check for Up arrow - scroll up
  LDI r3, 119         ; 'w' for up
  CMP r7, r3
  JZ r5, scroll_up

  ; Check for Down arrow - scroll down
  LDI r3, 115         ; 's' for down
  CMP r7, r3
  JZ r5, scroll_down

  ; Check for Escape - quit
  LDI r3, 27
  CMP r7, r3
  JZ r5, quit

  JMP no_key

scroll_up:
  LDI r7, SCROLL_OFF
  LOAD r7, r7
  JZ r7, no_key       ; already at top
  SUB r7, r11
  LDI r3, SCROLL_OFF
  STORE r3, r7
  JMP no_key

scroll_down:
  LDI r7, SCROLL_OFF
  LOAD r7, r7
  LDI r3, 50          ; max scroll
  CMP r7, r3
  BGE r5, no_key       ; at max
  ADD r7, r11
  LDI r3, SCROLL_OFF
  STORE r3, r7
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r7, 1
  LDI r3, LOADING_FLG
  STORE r3, r7

  ; Reset scroll
  LDI r7, 0
  LDI r3, SCROLL_OFF
  STORE r3, r7

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r7, 0
  LDI r3, LOADING_FLG
  STORE r3, r7

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r7, HIST_PTR
  LOAD r7, r7
  JZ r7, no_key       ; no history
  SUB r7, r11
  LDI r3, HIST_PTR
  STORE r3, r7

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
  LDI r11, 1

  ; Write mock page content to body buffer
  LDI r7, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r3, 71  ; G
  STORE r7, r3
  ADD r7, r11
  LDI r3, 101 ; e
  STORE r7, r3
  ADD r7, r11
  LDI r3, 111 ; o
  STORE r7, r3
  ADD r7, r11
  LDI r3, 109 ; m
  STORE r7, r3
  ADD r7, r11
  LDI r3, 101 ; e
  STORE r7, r3
  ADD r7, r11
  LDI r3, 116 ; t
  STORE r7, r3
  ADD r7, r11
  LDI r3, 114 ; r
  STORE r7, r3
  ADD r7, r11
  LDI r3, 121 ; y
  STORE r7, r3
  ADD r7, r11
  LDI r3, 32  ; (space)
  STORE r7, r3
  ADD r7, r11
  LDI r3, 79  ; O
  STORE r7, r3
  ADD r7, r11
  LDI r3, 83  ; S
  STORE r7, r3
  ADD r7, r11
  LDI r3, 32  ; (space)
  STORE r7, r3
  ADD r7, r11
  LDI r3, 66  ; B
  STORE r7, r3
  ADD r7, r11
  LDI r3, 114 ; r
  STORE r7, r3
  ADD r7, r11
  LDI r3, 111 ; o
  STORE r7, r3
  ADD r7, r11
  LDI r3, 119 ; w
  STORE r7, r3
  ADD r7, r11
  LDI r3, 115 ; s
  STORE r7, r3
  ADD r7, r11
  LDI r3, 101 ; e
  STORE r7, r3
  ADD r7, r11
  LDI r3, 114 ; r
  STORE r7, r3
  ADD r7, r11

  ; Null terminate
  LDI r3, 0
  STORE r7, r3

  ; Set body length
  LDI r7, BODY_LEN
  LDI r3, 20
  STORE r7, r3

  ; Set status = 200
  LDI r7, STATUS_CELL
  LDI r3, 200
  STORE r7, r3

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
