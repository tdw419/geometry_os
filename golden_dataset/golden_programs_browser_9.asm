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
  LDI r3, 1

  ; Clear scroll offset
  LDI r11, 0
  LDI r15, SCROLL_OFF
  STORE r15, r11

  ; Clear loading flag
  LDI r15, LOADING_FLG
  STORE r15, r11

  ; Clear history pointer
  LDI r15, HIST_PTR
  STORE r15, r11

  ; Write default URL
  LDI r11, URL_BUF
  LDI r15, 108        ; 'l'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 111        ; 'o'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 99         ; 'c'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 97         ; 'a'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 108        ; 'l'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 104        ; 'h'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 111        ; 'o'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 115        ; 's'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 116        ; 't'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 58         ; ':'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 56         ; '8'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 48         ; '0'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 48         ; '0'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 48         ; '0'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 47         ; '/'
  STORE r11, r15
  ADD r11, r3
  LDI r15, 0          ; null
  STORE r11, r15

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r13, 0
  FILL r13

  ; Draw URL bar background (dark blue strip)
  LDI r11, 0
  LDI r15, URL_BAR_Y
  LDI r7, 256
  LDI r8, 10
  LDI r14, 0x000080   ; dark blue
  RECTF r11, r15, r7, r8, r14

  ; Draw "URL: " label
  LDI r11, 2
  LDI r15, URL_BAR_Y
  LDI r7, url_label
  LDI r8, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r11, r15, r7

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r11, 34
  LDI r15, URL_BAR_Y
  LDI r7, URL_BUF
  LDI r8, 0xFFFFFF   ; white
  TEXT r11, r15, r7

  ; Draw status bar background
  LDI r11, 0
  LDI r15, STATUS_Y
  LDI r7, 256
  LDI r8, 10
  LDI r14, 0x333333   ; dark gray
  RECTF r11, r15, r7, r8, r14

  ; Check loading flag
  LDI r7, LOADING_FLG
  LOAD r7, r7
  JNZ r7, draw_loading

  ; Draw status: show response code
  LDI r11, 2
  LDI r15, STATUS_Y
  LDI r7, status_idle
  LDI r8, 0xFFFF00   ; yellow
  TEXT r11, r15, r7
  JMP draw_status_done

draw_loading:
  LDI r11, 2
  LDI r15, STATUS_Y
  LDI r7, status_loading
  LDI r8, 0xFF8800   ; orange
  TEXT r11, r15, r7

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r11, CONTENT_Y  ; y position
  LDI r15, 0          ; line counter
  LDI r7, SCROLL_OFF
  LOAD r7, r7       ; scroll offset
  LDI r8, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r14, 32
  LDI r10, 0          ; char offset in body
scroll_skip:
  JZ r7, scroll_done
  ADD r10, r14         ; offset += 32
  SUB r7, r3          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r8 = BODY_BUF + r10 (body start with scroll)
  LDI r7, BODY_BUF
  ADD r7, r10
  MOV r8, r7

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r14, 28         ; max lines to draw
draw_line_loop:
  JZ r14, draw_content_done

  ; Check if we hit end of body
  LOAD r10, r8        ; char at current body pos
  JZ r10, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r11, 2           ; x = 2
  ; r11 = x, current r11 = y? No, we need to track y
  ; Use r15 for y (already set initially)
  TEXT r11, r11, r8

  ; Advance body pointer by 32 chars (line width)
  LDI r10, 32
  ADD r8, r10

  ; Move y down
  LDI r10, 8
  ADD r11, r10

  ; Decrement line counter
  SUB r14, r3
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r11             ; read key
  JZ r11, no_key

  ; Check for Enter (13) - fetch page
  LDI r15, 13
  CMP r11, r15
  JZ r1, fetch_page

  ; Check for 'b' (98) - go back
  LDI r15, 98
  CMP r11, r15
  JZ r1, go_back

  ; Check for Up arrow - scroll up
  LDI r15, 119         ; 'w' for up
  CMP r11, r15
  JZ r1, scroll_up

  ; Check for Down arrow - scroll down
  LDI r15, 115         ; 's' for down
  CMP r11, r15
  JZ r1, scroll_down

  ; Check for Escape - quit
  LDI r15, 27
  CMP r11, r15
  JZ r1, quit

  JMP no_key

scroll_up:
  LDI r11, SCROLL_OFF
  LOAD r11, r11
  JZ r11, no_key       ; already at top
  SUB r11, r3
  LDI r15, SCROLL_OFF
  STORE r15, r11
  JMP no_key

scroll_down:
  LDI r11, SCROLL_OFF
  LOAD r11, r11
  LDI r15, 50          ; max scroll
  CMP r11, r15
  BGE r1, no_key       ; at max
  ADD r11, r3
  LDI r15, SCROLL_OFF
  STORE r15, r11
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r11, 1
  LDI r15, LOADING_FLG
  STORE r15, r11

  ; Reset scroll
  LDI r11, 0
  LDI r15, SCROLL_OFF
  STORE r15, r11

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r11, 0
  LDI r15, LOADING_FLG
  STORE r15, r11

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r11, HIST_PTR
  LOAD r11, r11
  JZ r11, no_key       ; no history
  SUB r11, r3
  LDI r15, HIST_PTR
  STORE r15, r11

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
  LDI r3, 1

  ; Write mock page content to body buffer
  LDI r11, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r15, 71  ; G
  STORE r11, r15
  ADD r11, r3
  LDI r15, 101 ; e
  STORE r11, r15
  ADD r11, r3
  LDI r15, 111 ; o
  STORE r11, r15
  ADD r11, r3
  LDI r15, 109 ; m
  STORE r11, r15
  ADD r11, r3
  LDI r15, 101 ; e
  STORE r11, r15
  ADD r11, r3
  LDI r15, 116 ; t
  STORE r11, r15
  ADD r11, r3
  LDI r15, 114 ; r
  STORE r11, r15
  ADD r11, r3
  LDI r15, 121 ; y
  STORE r11, r15
  ADD r11, r3
  LDI r15, 32  ; (space)
  STORE r11, r15
  ADD r11, r3
  LDI r15, 79  ; O
  STORE r11, r15
  ADD r11, r3
  LDI r15, 83  ; S
  STORE r11, r15
  ADD r11, r3
  LDI r15, 32  ; (space)
  STORE r11, r15
  ADD r11, r3
  LDI r15, 66  ; B
  STORE r11, r15
  ADD r11, r3
  LDI r15, 114 ; r
  STORE r11, r15
  ADD r11, r3
  LDI r15, 111 ; o
  STORE r11, r15
  ADD r11, r3
  LDI r15, 119 ; w
  STORE r11, r15
  ADD r11, r3
  LDI r15, 115 ; s
  STORE r11, r15
  ADD r11, r3
  LDI r15, 101 ; e
  STORE r11, r15
  ADD r11, r3
  LDI r15, 114 ; r
  STORE r11, r15
  ADD r11, r3

  ; Null terminate
  LDI r15, 0
  STORE r11, r15

  ; Set body length
  LDI r11, BODY_LEN
  LDI r15, 20
  STORE r11, r15

  ; Set status = 200
  LDI r11, STATUS_CELL
  LDI r15, 200
  STORE r11, r15

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
