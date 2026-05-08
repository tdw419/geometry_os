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
  LDI r9, 1

  ; Clear scroll offset
  LDI r6, 0
  LDI r14, SCROLL_OFF
  STORE r14, r6

  ; Clear loading flag
  LDI r14, LOADING_FLG
  STORE r14, r6

  ; Clear history pointer
  LDI r14, HIST_PTR
  STORE r14, r6

  ; Write default URL
  LDI r6, URL_BUF
  LDI r14, 108        ; 'l'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 111        ; 'o'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 99         ; 'c'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 97         ; 'a'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 108        ; 'l'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 104        ; 'h'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 111        ; 'o'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 115        ; 's'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 116        ; 't'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 58         ; ':'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 56         ; '8'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 48         ; '0'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 48         ; '0'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 48         ; '0'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 47         ; '/'
  STORE r6, r14
  ADD r6, r9
  LDI r14, 0          ; null
  STORE r6, r14

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r10, 0
  FILL r10

  ; Draw URL bar background (dark blue strip)
  LDI r6, 0
  LDI r14, URL_BAR_Y
  LDI r5, 256
  LDI r4, 10
  LDI r7, 0x000080   ; dark blue
  RECTF r6, r14, r5, r4, r7

  ; Draw "URL: " label
  LDI r6, 2
  LDI r14, URL_BAR_Y
  LDI r5, url_label
  LDI r4, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r6, r14, r5

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r6, 34
  LDI r14, URL_BAR_Y
  LDI r5, URL_BUF
  LDI r4, 0xFFFFFF   ; white
  TEXT r6, r14, r5

  ; Draw status bar background
  LDI r6, 0
  LDI r14, STATUS_Y
  LDI r5, 256
  LDI r4, 10
  LDI r7, 0x333333   ; dark gray
  RECTF r6, r14, r5, r4, r7

  ; Check loading flag
  LDI r5, LOADING_FLG
  LOAD r5, r5
  JNZ r5, draw_loading

  ; Draw status: show response code
  LDI r6, 2
  LDI r14, STATUS_Y
  LDI r5, status_idle
  LDI r4, 0xFFFF00   ; yellow
  TEXT r6, r14, r5
  JMP draw_status_done

draw_loading:
  LDI r6, 2
  LDI r14, STATUS_Y
  LDI r5, status_loading
  LDI r4, 0xFF8800   ; orange
  TEXT r6, r14, r5

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r6, CONTENT_Y  ; y position
  LDI r14, 0          ; line counter
  LDI r5, SCROLL_OFF
  LOAD r5, r5       ; scroll offset
  LDI r4, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r7, 32
  LDI r3, 0          ; char offset in body
scroll_skip:
  JZ r5, scroll_done
  ADD r3, r7         ; offset += 32
  SUB r5, r9          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r4 = BODY_BUF + r3 (body start with scroll)
  LDI r5, BODY_BUF
  ADD r5, r3
  MOV r4, r5

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r7, 28         ; max lines to draw
draw_line_loop:
  JZ r7, draw_content_done

  ; Check if we hit end of body
  LOAD r3, r4        ; char at current body pos
  JZ r3, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r6, 2           ; x = 2
  ; r6 = x, current r6 = y? No, we need to track y
  ; Use r14 for y (already set initially)
  TEXT r6, r6, r4

  ; Advance body pointer by 32 chars (line width)
  LDI r3, 32
  ADD r4, r3

  ; Move y down
  LDI r3, 8
  ADD r6, r3

  ; Decrement line counter
  SUB r7, r9
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r6             ; read key
  JZ r6, no_key

  ; Check for Enter (13) - fetch page
  LDI r14, 13
  CMP r6, r14
  JZ r13, fetch_page

  ; Check for 'b' (98) - go back
  LDI r14, 98
  CMP r6, r14
  JZ r13, go_back

  ; Check for Up arrow - scroll up
  LDI r14, 119         ; 'w' for up
  CMP r6, r14
  JZ r13, scroll_up

  ; Check for Down arrow - scroll down
  LDI r14, 115         ; 's' for down
  CMP r6, r14
  JZ r13, scroll_down

  ; Check for Escape - quit
  LDI r14, 27
  CMP r6, r14
  JZ r13, quit

  JMP no_key

scroll_up:
  LDI r6, SCROLL_OFF
  LOAD r6, r6
  JZ r6, no_key       ; already at top
  SUB r6, r9
  LDI r14, SCROLL_OFF
  STORE r14, r6
  JMP no_key

scroll_down:
  LDI r6, SCROLL_OFF
  LOAD r6, r6
  LDI r14, 50          ; max scroll
  CMP r6, r14
  BGE r13, no_key       ; at max
  ADD r6, r9
  LDI r14, SCROLL_OFF
  STORE r14, r6
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r6, 1
  LDI r14, LOADING_FLG
  STORE r14, r6

  ; Reset scroll
  LDI r6, 0
  LDI r14, SCROLL_OFF
  STORE r14, r6

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r6, 0
  LDI r14, LOADING_FLG
  STORE r14, r6

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r6, HIST_PTR
  LOAD r6, r6
  JZ r6, no_key       ; no history
  SUB r6, r9
  LDI r14, HIST_PTR
  STORE r14, r6

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
  LDI r9, 1

  ; Write mock page content to body buffer
  LDI r6, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r14, 71  ; G
  STORE r6, r14
  ADD r6, r9
  LDI r14, 101 ; e
  STORE r6, r14
  ADD r6, r9
  LDI r14, 111 ; o
  STORE r6, r14
  ADD r6, r9
  LDI r14, 109 ; m
  STORE r6, r14
  ADD r6, r9
  LDI r14, 101 ; e
  STORE r6, r14
  ADD r6, r9
  LDI r14, 116 ; t
  STORE r6, r14
  ADD r6, r9
  LDI r14, 114 ; r
  STORE r6, r14
  ADD r6, r9
  LDI r14, 121 ; y
  STORE r6, r14
  ADD r6, r9
  LDI r14, 32  ; (space)
  STORE r6, r14
  ADD r6, r9
  LDI r14, 79  ; O
  STORE r6, r14
  ADD r6, r9
  LDI r14, 83  ; S
  STORE r6, r14
  ADD r6, r9
  LDI r14, 32  ; (space)
  STORE r6, r14
  ADD r6, r9
  LDI r14, 66  ; B
  STORE r6, r14
  ADD r6, r9
  LDI r14, 114 ; r
  STORE r6, r14
  ADD r6, r9
  LDI r14, 111 ; o
  STORE r6, r14
  ADD r6, r9
  LDI r14, 119 ; w
  STORE r6, r14
  ADD r6, r9
  LDI r14, 115 ; s
  STORE r6, r14
  ADD r6, r9
  LDI r14, 101 ; e
  STORE r6, r14
  ADD r6, r9
  LDI r14, 114 ; r
  STORE r6, r14
  ADD r6, r9

  ; Null terminate
  LDI r14, 0
  STORE r6, r14

  ; Set body length
  LDI r6, BODY_LEN
  LDI r14, 20
  STORE r6, r14

  ; Set status = 200
  LDI r6, STATUS_CELL
  LDI r14, 200
  STORE r6, r14

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
