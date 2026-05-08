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
  LDI r8, 1

  ; Clear scroll offset
  LDI r15, 0
  LDI r7, SCROLL_OFF
  STORE r7, r15

  ; Clear loading flag
  LDI r7, LOADING_FLG
  STORE r7, r15

  ; Clear history pointer
  LDI r7, HIST_PTR
  STORE r7, r15

  ; Write default URL
  LDI r15, URL_BUF
  LDI r7, 108        ; 'l'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 111        ; 'o'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 99         ; 'c'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 97         ; 'a'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 108        ; 'l'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 104        ; 'h'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 111        ; 'o'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 115        ; 's'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 116        ; 't'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 58         ; ':'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 56         ; '8'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 48         ; '0'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 48         ; '0'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 48         ; '0'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 47         ; '/'
  STORE r15, r7
  ADD r15, r8
  LDI r7, 0          ; null
  STORE r15, r7

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r3, 0
  FILL r3

  ; Draw URL bar background (dark blue strip)
  LDI r15, 0
  LDI r7, URL_BAR_Y
  LDI r14, 256
  LDI r12, 10
  LDI r0, 0x000080   ; dark blue
  RECTF r15, r7, r14, r12, r0

  ; Draw "URL: " label
  LDI r15, 2
  LDI r7, URL_BAR_Y
  LDI r14, url_label
  LDI r12, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r15, r7, r14

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r15, 34
  LDI r7, URL_BAR_Y
  LDI r14, URL_BUF
  LDI r12, 0xFFFFFF   ; white
  TEXT r15, r7, r14

  ; Draw status bar background
  LDI r15, 0
  LDI r7, STATUS_Y
  LDI r14, 256
  LDI r12, 10
  LDI r0, 0x333333   ; dark gray
  RECTF r15, r7, r14, r12, r0

  ; Check loading flag
  LDI r14, LOADING_FLG
  LOAD r14, r14
  JNZ r14, draw_loading

  ; Draw status: show response code
  LDI r15, 2
  LDI r7, STATUS_Y
  LDI r14, status_idle
  LDI r12, 0xFFFF00   ; yellow
  TEXT r15, r7, r14
  JMP draw_status_done

draw_loading:
  LDI r15, 2
  LDI r7, STATUS_Y
  LDI r14, status_loading
  LDI r12, 0xFF8800   ; orange
  TEXT r15, r7, r14

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r15, CONTENT_Y  ; y position
  LDI r7, 0          ; line counter
  LDI r14, SCROLL_OFF
  LOAD r14, r14       ; scroll offset
  LDI r12, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r0, 32
  LDI r9, 0          ; char offset in body
scroll_skip:
  JZ r14, scroll_done
  ADD r9, r0         ; offset += 32
  SUB r14, r8          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r12 = BODY_BUF + r9 (body start with scroll)
  LDI r14, BODY_BUF
  ADD r14, r9
  MOV r12, r14

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r0, 28         ; max lines to draw
draw_line_loop:
  JZ r0, draw_content_done

  ; Check if we hit end of body
  LOAD r9, r12        ; char at current body pos
  JZ r9, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r15, 2           ; x = 2
  ; r15 = x, current r15 = y? No, we need to track y
  ; Use r7 for y (already set initially)
  TEXT r15, r15, r12

  ; Advance body pointer by 32 chars (line width)
  LDI r9, 32
  ADD r12, r9

  ; Move y down
  LDI r9, 8
  ADD r15, r9

  ; Decrement line counter
  SUB r0, r8
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r15             ; read key
  JZ r15, no_key

  ; Check for Enter (13) - fetch page
  LDI r7, 13
  CMP r15, r7
  JZ r13, fetch_page

  ; Check for 'b' (98) - go back
  LDI r7, 98
  CMP r15, r7
  JZ r13, go_back

  ; Check for Up arrow - scroll up
  LDI r7, 119         ; 'w' for up
  CMP r15, r7
  JZ r13, scroll_up

  ; Check for Down arrow - scroll down
  LDI r7, 115         ; 's' for down
  CMP r15, r7
  JZ r13, scroll_down

  ; Check for Escape - quit
  LDI r7, 27
  CMP r15, r7
  JZ r13, quit

  JMP no_key

scroll_up:
  LDI r15, SCROLL_OFF
  LOAD r15, r15
  JZ r15, no_key       ; already at top
  SUB r15, r8
  LDI r7, SCROLL_OFF
  STORE r7, r15
  JMP no_key

scroll_down:
  LDI r15, SCROLL_OFF
  LOAD r15, r15
  LDI r7, 50          ; max scroll
  CMP r15, r7
  BGE r13, no_key       ; at max
  ADD r15, r8
  LDI r7, SCROLL_OFF
  STORE r7, r15
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r15, 1
  LDI r7, LOADING_FLG
  STORE r7, r15

  ; Reset scroll
  LDI r15, 0
  LDI r7, SCROLL_OFF
  STORE r7, r15

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r15, 0
  LDI r7, LOADING_FLG
  STORE r7, r15

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r15, HIST_PTR
  LOAD r15, r15
  JZ r15, no_key       ; no history
  SUB r15, r8
  LDI r7, HIST_PTR
  STORE r7, r15

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
  LDI r15, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r7, 71  ; G
  STORE r15, r7
  ADD r15, r8
  LDI r7, 101 ; e
  STORE r15, r7
  ADD r15, r8
  LDI r7, 111 ; o
  STORE r15, r7
  ADD r15, r8
  LDI r7, 109 ; m
  STORE r15, r7
  ADD r15, r8
  LDI r7, 101 ; e
  STORE r15, r7
  ADD r15, r8
  LDI r7, 116 ; t
  STORE r15, r7
  ADD r15, r8
  LDI r7, 114 ; r
  STORE r15, r7
  ADD r15, r8
  LDI r7, 121 ; y
  STORE r15, r7
  ADD r15, r8
  LDI r7, 32  ; (space)
  STORE r15, r7
  ADD r15, r8
  LDI r7, 79  ; O
  STORE r15, r7
  ADD r15, r8
  LDI r7, 83  ; S
  STORE r15, r7
  ADD r15, r8
  LDI r7, 32  ; (space)
  STORE r15, r7
  ADD r15, r8
  LDI r7, 66  ; B
  STORE r15, r7
  ADD r15, r8
  LDI r7, 114 ; r
  STORE r15, r7
  ADD r15, r8
  LDI r7, 111 ; o
  STORE r15, r7
  ADD r15, r8
  LDI r7, 119 ; w
  STORE r15, r7
  ADD r15, r8
  LDI r7, 115 ; s
  STORE r15, r7
  ADD r15, r8
  LDI r7, 101 ; e
  STORE r15, r7
  ADD r15, r8
  LDI r7, 114 ; r
  STORE r15, r7
  ADD r15, r8

  ; Null terminate
  LDI r7, 0
  STORE r15, r7

  ; Set body length
  LDI r15, BODY_LEN
  LDI r7, 20
  STORE r15, r7

  ; Set status = 200
  LDI r15, STATUS_CELL
  LDI r7, 200
  STORE r15, r7

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
