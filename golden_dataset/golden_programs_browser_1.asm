; DESCRIPTION: Display a object using color colored at the screen.

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
  LDI r8, 0
  LDI r10, SCROLL_OFF
  STORE r10, r8

  ; Clear loading flag
  LDI r10, LOADING_FLG
  STORE r10, r8

  ; Clear history pointer
  LDI r10, HIST_PTR
  STORE r10, r8

  ; Write default URL
  LDI r8, URL_BUF
  LDI r10, 108        ; 'l'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 111        ; 'o'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 99         ; 'c'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 97         ; 'a'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 108        ; 'l'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 104        ; 'h'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 111        ; 'o'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 115        ; 's'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 116        ; 't'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 58         ; ':'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 56         ; '8'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 48         ; '0'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 48         ; '0'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 48         ; '0'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 47         ; '/'
  STORE r8, r10
  ADD r8, r2
  LDI r10, 0          ; null
  STORE r8, r10

; ═══════════════════════════════════════
; Main loop
; ═══════════════════════════════════════
main_loop:
  LDI r11, 0
  FILL r11

  ; Draw URL bar background (dark blue strip)
  LDI r8, 0
  LDI r10, URL_BAR_Y
  LDI r9, 256
  LDI r5, 10
  LDI r1, 0x000080   ; dark blue
  RECTF r8, r10, r9, r5, r1

  ; Draw "URL: " label
  LDI r8, 2
  LDI r10, URL_BAR_Y
  LDI r9, url_label
  LDI r5, 0x00FFFF   ; cyan
  ; Use TEXT opcode to render label
  TEXT r8, r10, r9

  ; Draw URL text after "URL: " (shift right by ~40px)
  LDI r8, 34
  LDI r10, URL_BAR_Y
  LDI r9, URL_BUF
  LDI r5, 0xFFFFFF   ; white
  TEXT r8, r10, r9

  ; Draw status bar background
  LDI r8, 0
  LDI r10, STATUS_Y
  LDI r9, 256
  LDI r5, 10
  LDI r1, 0x333333   ; dark gray
  RECTF r8, r10, r9, r5, r1

  ; Check loading flag
  LDI r9, LOADING_FLG
  LOAD r9, r9
  JNZ r9, draw_loading

  ; Draw status: show response code
  LDI r8, 2
  LDI r10, STATUS_Y
  LDI r9, status_idle
  LDI r5, 0xFFFF00   ; yellow
  TEXT r8, r10, r9
  JMP draw_status_done

draw_loading:
  LDI r8, 2
  LDI r10, STATUS_Y
  LDI r9, status_loading
  LDI r5, 0xFF8800   ; orange
  TEXT r8, r10, r9

draw_status_done:
  ; ── Draw content area ──
  ; Render body text line by line
  LDI r8, CONTENT_Y  ; y position
  LDI r10, 0          ; line counter
  LDI r9, SCROLL_OFF
  LOAD r9, r9       ; scroll offset
  LDI r5, BODY_BUF   ; body pointer (adjusted by scroll)

  ; Calculate start position in body based on scroll
  ; Each "line" is ~40 chars for wrapping. Approximate: skip scroll*32 chars
  LDI r1, 32
  LDI r14, 0          ; char offset in body
scroll_skip:
  JZ r9, scroll_done
  ADD r14, r1         ; offset += 32
  SUB r9, r2          ; scroll--
  JMP scroll_skip

scroll_done:
  ; r5 = BODY_BUF + r14 (body start with scroll)
  LDI r9, BODY_BUF
  ADD r9, r14
  MOV r5, r9

  ; Draw up to 28 lines (224px of content area / 8px per line)
  LDI r1, 28         ; max lines to draw
draw_line_loop:
  JZ r1, draw_content_done

  ; Check if we hit end of body
  LOAD r14, r5        ; char at current body pos
  JZ r14, draw_content_done

  ; Draw this line of text (up to 32 chars, TEXT opcode handles it)
  LDI r8, 2           ; x = 2
  ; r8 = x, current r8 = y? No, we need to track y
  ; Use r10 for y (already set initially)
  TEXT r8, r8, r5

  ; Advance body pointer by 32 chars (line width)
  LDI r14, 32
  ADD r5, r14

  ; Move y down
  LDI r14, 8
  ADD r8, r14

  ; Decrement line counter
  SUB r1, r2
  JMP draw_line_loop

draw_content_done:
  ; ── Handle keyboard input ──
  IKEY r8             ; read key
  JZ r8, no_key

  ; Check for Enter (13) - fetch page
  LDI r10, 13
  CMP r8, r10
  JZ r15, fetch_page

  ; Check for 'b' (98) - go back
  LDI r10, 98
  CMP r8, r10
  JZ r15, go_back

  ; Check for Up arrow - scroll up
  LDI r10, 119         ; 'w' for up
  CMP r8, r10
  JZ r15, scroll_up

  ; Check for Down arrow - scroll down
  LDI r10, 115         ; 's' for down
  CMP r8, r10
  JZ r15, scroll_down

  ; Check for Escape - quit
  LDI r10, 27
  CMP r8, r10
  JZ r15, quit

  JMP no_key

scroll_up:
  LDI r8, SCROLL_OFF
  LOAD r8, r8
  JZ r8, no_key       ; already at top
  SUB r8, r2
  LDI r10, SCROLL_OFF
  STORE r10, r8
  JMP no_key

scroll_down:
  LDI r8, SCROLL_OFF
  LOAD r8, r8
  LDI r10, 50          ; max scroll
  CMP r8, r10
  BGE r15, no_key       ; at max
  ADD r8, r2
  LDI r10, SCROLL_OFF
  STORE r10, r8
  JMP no_key

fetch_page:
  ; Set loading flag
  LDI r8, 1
  LDI r10, LOADING_FLG
  STORE r10, r8

  ; Reset scroll
  LDI r8, 0
  LDI r10, SCROLL_OFF
  STORE r10, r8

  ; Call the HTTP get library
  ; (In real usage, this would be CALL http_get)
  ; For the browser demo, we do it inline since we can't .include yet
  CALL do_fetch

  ; Clear loading flag
  LDI r8, 0
  LDI r10, LOADING_FLG
  STORE r10, r8

  JMP no_key

go_back:
  ; Decrement history pointer
  LDI r8, HIST_PTR
  LOAD r8, r8
  JZ r8, no_key       ; no history
  SUB r8, r2
  LDI r10, HIST_PTR
  STORE r10, r8

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
  LDI r8, BODY_BUF

  ; "Geometry OS Browser v1.0"
  LDI r10, 71  ; G
  STORE r8, r10
  ADD r8, r2
  LDI r10, 101 ; e
  STORE r8, r10
  ADD r8, r2
  LDI r10, 111 ; o
  STORE r8, r10
  ADD r8, r2
  LDI r10, 109 ; m
  STORE r8, r10
  ADD r8, r2
  LDI r10, 101 ; e
  STORE r8, r10
  ADD r8, r2
  LDI r10, 116 ; t
  STORE r8, r10
  ADD r8, r2
  LDI r10, 114 ; r
  STORE r8, r10
  ADD r8, r2
  LDI r10, 121 ; y
  STORE r8, r10
  ADD r8, r2
  LDI r10, 32  ; (space)
  STORE r8, r10
  ADD r8, r2
  LDI r10, 79  ; O
  STORE r8, r10
  ADD r8, r2
  LDI r10, 83  ; S
  STORE r8, r10
  ADD r8, r2
  LDI r10, 32  ; (space)
  STORE r8, r10
  ADD r8, r2
  LDI r10, 66  ; B
  STORE r8, r10
  ADD r8, r2
  LDI r10, 114 ; r
  STORE r8, r10
  ADD r8, r2
  LDI r10, 111 ; o
  STORE r8, r10
  ADD r8, r2
  LDI r10, 119 ; w
  STORE r8, r10
  ADD r8, r2
  LDI r10, 115 ; s
  STORE r8, r10
  ADD r8, r2
  LDI r10, 101 ; e
  STORE r8, r10
  ADD r8, r2
  LDI r10, 114 ; r
  STORE r8, r10
  ADD r8, r2

  ; Null terminate
  LDI r10, 0
  STORE r8, r10

  ; Set body length
  LDI r8, BODY_LEN
  LDI r10, 20
  STORE r8, r10

  ; Set status = 200
  LDI r8, STATUS_CELL
  LDI r10, 200
  STORE r8, r10

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
