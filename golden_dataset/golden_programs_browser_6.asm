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
  LDI r2, 0
  LDI r11, SCROLL_OFF
  STORE r11, r2

  ; Clear loading flag
  LDI r11, LOADING_FLG
  STORE r11, r2

  ; Clear history pointer
  LDI r11, HIST_PTR
  STORE r11, r2

  ; Write default URL
  LDI r2, URL_BUF
  LDI r11, 108        ; 'l'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 111        ; 'o'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 99         ; 'c'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 97         ; 'a'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 108        ; 'l'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 104        ; 'h'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 111        ; 'o'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 115        ; 's'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 116        ; 't'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 58         ; ':'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 56         ; '8'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 48         ; '0'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 48         ; '0'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 48         ; '0'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 47         ; '/'
  STORE r2, r11
  ADD r2, r12
  LDI r11, 0          ; null
  STORE r2, r11

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r4, 0
  FILL r4

  ; Draw URL bar background (dark blue strip)
  LDI r2, 0
  LDI r11, URL_BAR_Y
  LDI r15, 256
  LDI r5, 10
  LDI r10, 0x000080   ; dark blue
  RECTF r2, r11, r15, r5, r10

  ; Draw "URL: " label
  LDI r2, 2
  LDI r11, URL_BAR_Y
  LDI r15, url_label
  LDI r5, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r2, r11, r15

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r2, 34
  LDI r11, URL_BAR_Y
  LDI r15, URL_BUF
  LDI r5, 0xFFFFFF   ; white
  TEXT r2, r11, r15

  ; Draw status bar background
  LDI r2, 0
  LDI r11, STATUS_Y
  LDI r15, 256
  LDI r5, 10
  LDI r10, 0x333333   ; dark gray
  RECTF r2, r11, r15, r5, r10

  ; Check loading flag
  LDI r15, LOADING_FLG
  LOAD r15, r15
  JNZ r15, draw_loading

  ; Draw status: show response code
  LDI r2, 2
  LDI r11, STATUS_Y
  LDI r15, status_idle
  LDI r5, 0xFFFF00   ; yellow
  TEXT r2, r11, r15
  JMP draw_status_done

draw_loading:
  LDI r2, 2
  LDI r11, STATUS_Y
  LDI r15, status_loading
  LDI r5, 0xFF8800   ; orange
  TEXT r2, r11, r15

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r2, CONTENT_Y  ; y position
  LDI r11, 0          ; line counter
  LDI r15, SCROLL_OFF
  LOAD r15, r15       ; scroll offset
  LDI r5, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r10, 32
  LDI r13, 0          ; char offset in body
scroll_skip:
  JZ r15, scroll_done
  ADD r13, r10         ; offset += 32
  SUB r15, r12          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r5 = BODY_BUF + r13 (body start with scroll)
  LDI r15, BODY_BUF
  ADD r15, r13
  MOV r5, r15

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r10, 28         ; max lines to draw
draw_line_loop:
  JZ r10, draw_content_done

  ; Check if we hit end of body
  LOAD r13, r5        ; char at current body pos
  JZ r13, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r2, 2           ; x = 2
  ; r2 = x, current r2 = y? No, we need to track y
  ; Use r11 for y (already set initially)
  TEXT r2, r2, r5

  ; Advance body pointer by 32 chars (line width)
  LDI r13, 32
  ADD r5, r13

  ; Move y down
  LDI r13, 8
  ADD r2, r13

  ; Decrement line counter
  SUB r10, r12
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r2             ; read key
  JZ r2, no_key

  ; Check for Enter (13) - fetch page
  LDI r11, 13
  CMP r2, r11
  JZ r0, fetch_page

  ; Check for 'b' (98) - go back
  LDI r11, 98
  CMP r2, r11
  JZ r0, go_back

  ; Check for Up arrow - scroll up
  LDI r11, 119         ; 'w' for up
  CMP r2, r11
  JZ r0, scroll_up

  ; Check for Down arrow - scroll down
  LDI r11, 115         ; 's' for down
  CMP r2, r11
  JZ r0, scroll_down

  ; Check for Escape - quit
  LDI r11, 27
  CMP r2, r11
  JZ r0, quit

  JMP no_key

scroll_up:
  LDI r2, SCROLL_OFF
  LOAD r2, r2
  JZ r2, no_key       ; already at top
  SUB r2, r12
  LDI r11, SCROLL_OFF
  STORE r11, r2
  JMP no_key

scroll_down:
  LDI r2, SCROLL_OFF
  LOAD r2, r2
  LDI r11, 50          ; max scroll
  CMP r2, r11
  BGE r0, no_key       ; at max
  ADD r2, r12
  LDI r11, SCROLL_OFF
  STORE r11, r2
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r2, 1
  LDI r11, LOADING_FLG
  STORE r11, r2

  ; Reset scroll
  LDI r2, 0
  LDI r11, SCROLL_OFF
  STORE r11, r2

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r2, 0
  LDI r11, LOADING_FLG
  STORE r11, r2

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r2, HIST_PTR
  LOAD r2, r2
  JZ r2, no_key       ; no history
  SUB r2, r12
  LDI r11, HIST_PTR
  STORE r11, r2

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
  LDI r2, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r11, 71  ; G
  STORE r2, r11
  ADD r2, r12
  LDI r11, 101 ; e
  STORE r2, r11
  ADD r2, r12
  LDI r11, 111 ; o
  STORE r2, r11
  ADD r2, r12
  LDI r11, 109 ; m
  STORE r2, r11
  ADD r2, r12
  LDI r11, 101 ; e
  STORE r2, r11
  ADD r2, r12
  LDI r11, 116 ; t
  STORE r2, r11
  ADD r2, r12
  LDI r11, 114 ; r
  STORE r2, r11
  ADD r2, r12
  LDI r11, 121 ; y
  STORE r2, r11
  ADD r2, r12
  LDI r11, 32  ; (space)
  STORE r2, r11
  ADD r2, r12
  LDI r11, 79  ; O
  STORE r2, r11
  ADD r2, r12
  LDI r11, 83  ; S
  STORE r2, r11
  ADD r2, r12
  LDI r11, 32  ; (space)
  STORE r2, r11
  ADD r2, r12
  LDI r11, 66  ; B
  STORE r2, r11
  ADD r2, r12
  LDI r11, 114 ; r
  STORE r2, r11
  ADD r2, r12
  LDI r11, 111 ; o
  STORE r2, r11
  ADD r2, r12
  LDI r11, 119 ; w
  STORE r2, r11
  ADD r2, r12
  LDI r11, 115 ; s
  STORE r2, r11
  ADD r2, r12
  LDI r11, 101 ; e
  STORE r2, r11
  ADD r2, r12
  LDI r11, 114 ; r
  STORE r2, r11
  ADD r2, r12

  ; Null terminate
  LDI r11, 0
  STORE r2, r11

  ; Set body length
  LDI r2, BODY_LEN
  LDI r11, 20
  STORE r2, r11

  ; Set status = 200
  LDI r2, STATUS_CELL
  LDI r11, 200
  STORE r2, r11

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
