; DESCRIPTION: A colored object centered at the screen with fixed size.

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
  LDI r2, 1

  ; Clear scroll offset
  LDI r13, 0
  LDI r14, SCROLL_OFF
  STORE r14, r13

  ; Clear loading flag
  LDI r14, LOADING_FLG
  STORE r14, r13

  ; Clear history pointer
  LDI r14, HIST_PTR
  STORE r14, r13

  ; Write default URL
  LDI r13, URL_BUF
  LDI r14, 108        ; 'l'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 111        ; 'o'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 99         ; 'c'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 97         ; 'a'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 108        ; 'l'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 104        ; 'h'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 111        ; 'o'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 115        ; 's'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 116        ; 't'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 58         ; ':'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 56         ; '8'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 48         ; '0'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 48         ; '0'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 48         ; '0'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 47         ; '/'
  STORE r13, r14
  ADD r13, r2
  LDI r14, 0          ; null
  STORE r13, r14

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r9, 0
  FILL r9

  ; Draw URL bar background (dark blue strip)
  LDI r13, 0
  LDI r14, URL_BAR_Y
  LDI r4, 256
  LDI r11, 10
  LDI r5, 0x000080   ; dark blue
  RECTF r13, r14, r4, r11, r5

  ; Draw "URL: " label
  LDI r13, 2
  LDI r14, URL_BAR_Y
  LDI r4, url_label
  LDI r11, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r13, r14, r4

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r13, 34
  LDI r14, URL_BAR_Y
  LDI r4, URL_BUF
  LDI r11, 0xFFFFFF   ; white
  TEXT r13, r14, r4

  ; Draw status bar background
  LDI r13, 0
  LDI r14, STATUS_Y
  LDI r4, 256
  LDI r11, 10
  LDI r5, 0x333333   ; dark gray
  RECTF r13, r14, r4, r11, r5

  ; Check loading flag
  LDI r4, LOADING_FLG
  LOAD r4, r4
  JNZ r4, draw_loading

  ; Draw status: show response code
  LDI r13, 2
  LDI r14, STATUS_Y
  LDI r4, status_idle
  LDI r11, 0xFFFF00   ; yellow
  TEXT r13, r14, r4
  JMP draw_status_done

draw_loading:
  LDI r13, 2
  LDI r14, STATUS_Y
  LDI r4, status_loading
  LDI r11, 0xFF8800   ; orange
  TEXT r13, r14, r4

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r13, CONTENT_Y  ; y position
  LDI r14, 0          ; line counter
  LDI r4, SCROLL_OFF
  LOAD r4, r4       ; scroll offset
  LDI r11, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r5, 32
  LDI r7, 0          ; char offset in body
scroll_skip:
  JZ r4, scroll_done
  ADD r7, r5         ; offset += 32
  SUB r4, r2          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r11 = BODY_BUF + r7 (body start with scroll)
  LDI r4, BODY_BUF
  ADD r4, r7
  MOV r11, r4

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r5, 28         ; max lines to draw
draw_line_loop:
  JZ r5, draw_content_done

  ; Check if we hit end of body
  LOAD r7, r11        ; char at current body pos
  JZ r7, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r13, 2           ; x = 2
  ; r13 = x, current r13 = y? No, we need to track y
  ; Use r14 for y (already set initially)
  TEXT r13, r13, r11

  ; Advance body pointer by 32 chars (line width)
  LDI r7, 32
  ADD r11, r7

  ; Move y down
  LDI r7, 8
  ADD r13, r7

  ; Decrement line counter
  SUB r5, r2
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r13             ; read key
  JZ r13, no_key

  ; Check for Enter (13) - fetch page
  LDI r14, 13
  CMP r13, r14
  JZ r15, fetch_page

  ; Check for 'b' (98) - go back
  LDI r14, 98
  CMP r13, r14
  JZ r15, go_back

  ; Check for Up arrow - scroll up
  LDI r14, 119         ; 'w' for up
  CMP r13, r14
  JZ r15, scroll_up

  ; Check for Down arrow - scroll down
  LDI r14, 115         ; 's' for down
  CMP r13, r14
  JZ r15, scroll_down

  ; Check for Escape - quit
  LDI r14, 27
  CMP r13, r14
  JZ r15, quit

  JMP no_key

scroll_up:
  LDI r13, SCROLL_OFF
  LOAD r13, r13
  JZ r13, no_key       ; already at top
  SUB r13, r2
  LDI r14, SCROLL_OFF
  STORE r14, r13
  JMP no_key

scroll_down:
  LDI r13, SCROLL_OFF
  LOAD r13, r13
  LDI r14, 50          ; max scroll
  CMP r13, r14
  BGE r15, no_key       ; at max
  ADD r13, r2
  LDI r14, SCROLL_OFF
  STORE r14, r13
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r13, 1
  LDI r14, LOADING_FLG
  STORE r14, r13

  ; Reset scroll
  LDI r13, 0
  LDI r14, SCROLL_OFF
  STORE r14, r13

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r13, 0
  LDI r14, LOADING_FLG
  STORE r14, r13

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r13, HIST_PTR
  LOAD r13, r13
  JZ r13, no_key       ; no history
  SUB r13, r2
  LDI r14, HIST_PTR
  STORE r14, r13

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
  LDI r2, 1

  ; Write mock page content to body buffer
  LDI r13, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r14, 71  ; G
  STORE r13, r14
  ADD r13, r2
  LDI r14, 101 ; e
  STORE r13, r14
  ADD r13, r2
  LDI r14, 111 ; o
  STORE r13, r14
  ADD r13, r2
  LDI r14, 109 ; m
  STORE r13, r14
  ADD r13, r2
  LDI r14, 101 ; e
  STORE r13, r14
  ADD r13, r2
  LDI r14, 116 ; t
  STORE r13, r14
  ADD r13, r2
  LDI r14, 114 ; r
  STORE r13, r14
  ADD r13, r2
  LDI r14, 121 ; y
  STORE r13, r14
  ADD r13, r2
  LDI r14, 32  ; (space)
  STORE r13, r14
  ADD r13, r2
  LDI r14, 79  ; O
  STORE r13, r14
  ADD r13, r2
  LDI r14, 83  ; S
  STORE r13, r14
  ADD r13, r2
  LDI r14, 32  ; (space)
  STORE r13, r14
  ADD r13, r2
  LDI r14, 66  ; B
  STORE r13, r14
  ADD r13, r2
  LDI r14, 114 ; r
  STORE r13, r14
  ADD r13, r2
  LDI r14, 111 ; o
  STORE r13, r14
  ADD r13, r2
  LDI r14, 119 ; w
  STORE r13, r14
  ADD r13, r2
  LDI r14, 115 ; s
  STORE r13, r14
  ADD r13, r2
  LDI r14, 101 ; e
  STORE r13, r14
  ADD r13, r2
  LDI r14, 114 ; r
  STORE r13, r14
  ADD r13, r2

  ; Null terminate
  LDI r14, 0
  STORE r13, r14

  ; Set body length
  LDI r13, BODY_LEN
  LDI r14, 20
  STORE r13, r14

  ; Set status = 200
  LDI r13, STATUS_CELL
  LDI r14, 200
  STORE r13, r14

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
