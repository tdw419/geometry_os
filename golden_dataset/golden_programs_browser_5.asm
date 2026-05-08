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
  LDI r12, 1

  ; Clear scroll offset
  LDI r4, 0
  LDI r13, SCROLL_OFF
  STORE r13, r4

  ; Clear loading flag
  LDI r13, LOADING_FLG
  STORE r13, r4

  ; Clear history pointer
  LDI r13, HIST_PTR
  STORE r13, r4

  ; Write default URL
  LDI r4, URL_BUF
  LDI r13, 108        ; 'l'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 111        ; 'o'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 99         ; 'c'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 97         ; 'a'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 108        ; 'l'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 104        ; 'h'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 111        ; 'o'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 115        ; 's'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 116        ; 't'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 58         ; ':'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 56         ; '8'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 48         ; '0'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 48         ; '0'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 48         ; '0'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 47         ; '/'
  STORE r4, r13
  ADD r4, r12
  LDI r13, 0          ; null
  STORE r4, r13

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r0, 0
  FILL r0

  ; Draw URL bar background (dark blue strip)
  LDI r4, 0
  LDI r13, URL_BAR_Y
  LDI r6, 256
  LDI r5, 10
  LDI r11, 0x000080   ; dark blue
  RECTF r4, r13, r6, r5, r11

  ; Draw "URL: " label
  LDI r4, 2
  LDI r13, URL_BAR_Y
  LDI r6, url_label
  LDI r5, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r4, r13, r6

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r4, 34
  LDI r13, URL_BAR_Y
  LDI r6, URL_BUF
  LDI r5, 0xFFFFFF   ; white
  TEXT r4, r13, r6

  ; Draw status bar background
  LDI r4, 0
  LDI r13, STATUS_Y
  LDI r6, 256
  LDI r5, 10
  LDI r11, 0x333333   ; dark gray
  RECTF r4, r13, r6, r5, r11

  ; Check loading flag
  LDI r6, LOADING_FLG
  LOAD r6, r6
  JNZ r6, draw_loading

  ; Draw status: show response code
  LDI r4, 2
  LDI r13, STATUS_Y
  LDI r6, status_idle
  LDI r5, 0xFFFF00   ; yellow
  TEXT r4, r13, r6
  JMP draw_status_done

draw_loading:
  LDI r4, 2
  LDI r13, STATUS_Y
  LDI r6, status_loading
  LDI r5, 0xFF8800   ; orange
  TEXT r4, r13, r6

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r4, CONTENT_Y  ; y position
  LDI r13, 0          ; line counter
  LDI r6, SCROLL_OFF
  LOAD r6, r6       ; scroll offset
  LDI r5, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r11, 32
  LDI r7, 0          ; char offset in body
scroll_skip:
  JZ r6, scroll_done
  ADD r7, r11         ; offset += 32
  SUB r6, r12          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r5 = BODY_BUF + r7 (body start with scroll)
  LDI r6, BODY_BUF
  ADD r6, r7
  MOV r5, r6

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r11, 28         ; max lines to draw
draw_line_loop:
  JZ r11, draw_content_done

  ; Check if we hit end of body
  LOAD r7, r5        ; char at current body pos
  JZ r7, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r4, 2           ; x = 2
  ; r4 = x, current r4 = y? No, we need to track y
  ; Use r13 for y (already set initially)
  TEXT r4, r4, r5

  ; Advance body pointer by 32 chars (line width)
  LDI r7, 32
  ADD r5, r7

  ; Move y down
  LDI r7, 8
  ADD r4, r7

  ; Decrement line counter
  SUB r11, r12
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r4             ; read key
  JZ r4, no_key

  ; Check for Enter (13) - fetch page
  LDI r13, 13
  CMP r4, r13
  JZ r2, fetch_page

  ; Check for 'b' (98) - go back
  LDI r13, 98
  CMP r4, r13
  JZ r2, go_back

  ; Check for Up arrow - scroll up
  LDI r13, 119         ; 'w' for up
  CMP r4, r13
  JZ r2, scroll_up

  ; Check for Down arrow - scroll down
  LDI r13, 115         ; 's' for down
  CMP r4, r13
  JZ r2, scroll_down

  ; Check for Escape - quit
  LDI r13, 27
  CMP r4, r13
  JZ r2, quit

  JMP no_key

scroll_up:
  LDI r4, SCROLL_OFF
  LOAD r4, r4
  JZ r4, no_key       ; already at top
  SUB r4, r12
  LDI r13, SCROLL_OFF
  STORE r13, r4
  JMP no_key

scroll_down:
  LDI r4, SCROLL_OFF
  LOAD r4, r4
  LDI r13, 50          ; max scroll
  CMP r4, r13
  BGE r2, no_key       ; at max
  ADD r4, r12
  LDI r13, SCROLL_OFF
  STORE r13, r4
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r4, 1
  LDI r13, LOADING_FLG
  STORE r13, r4

  ; Reset scroll
  LDI r4, 0
  LDI r13, SCROLL_OFF
  STORE r13, r4

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r4, 0
  LDI r13, LOADING_FLG
  STORE r13, r4

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r4, HIST_PTR
  LOAD r4, r4
  JZ r4, no_key       ; no history
  SUB r4, r12
  LDI r13, HIST_PTR
  STORE r13, r4

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
  LDI r4, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r13, 71  ; G
  STORE r4, r13
  ADD r4, r12
  LDI r13, 101 ; e
  STORE r4, r13
  ADD r4, r12
  LDI r13, 111 ; o
  STORE r4, r13
  ADD r4, r12
  LDI r13, 109 ; m
  STORE r4, r13
  ADD r4, r12
  LDI r13, 101 ; e
  STORE r4, r13
  ADD r4, r12
  LDI r13, 116 ; t
  STORE r4, r13
  ADD r4, r12
  LDI r13, 114 ; r
  STORE r4, r13
  ADD r4, r12
  LDI r13, 121 ; y
  STORE r4, r13
  ADD r4, r12
  LDI r13, 32  ; (space)
  STORE r4, r13
  ADD r4, r12
  LDI r13, 79  ; O
  STORE r4, r13
  ADD r4, r12
  LDI r13, 83  ; S
  STORE r4, r13
  ADD r4, r12
  LDI r13, 32  ; (space)
  STORE r4, r13
  ADD r4, r12
  LDI r13, 66  ; B
  STORE r4, r13
  ADD r4, r12
  LDI r13, 114 ; r
  STORE r4, r13
  ADD r4, r12
  LDI r13, 111 ; o
  STORE r4, r13
  ADD r4, r12
  LDI r13, 119 ; w
  STORE r4, r13
  ADD r4, r12
  LDI r13, 115 ; s
  STORE r4, r13
  ADD r4, r12
  LDI r13, 101 ; e
  STORE r4, r13
  ADD r4, r12
  LDI r13, 114 ; r
  STORE r4, r13
  ADD r4, r12

  ; Null terminate
  LDI r13, 0
  STORE r4, r13

  ; Set body length
  LDI r4, BODY_LEN
  LDI r13, 20
  STORE r4, r13

  ; Set status = 200
  LDI r4, STATUS_CELL
  LDI r13, 200
  STORE r4, r13

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
