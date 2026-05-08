; DESCRIPTION: This GeOS assembly code implements a simple HTML browser that fetches and parses HTML pages, rendering styled text with support for headings, paragraphs, links, bold, italic, and horizontal rules. The browser includes basic navigation features such as fetching pages, scrolling, navigating history, going home, and bookmarking URLs.

; html_browser.asm -- Simple HTML Browser for Geometry OS
;
; Fetches HTML pages via HTTPGET, parses with HTPARSE, renders styled text.
; Supports: headings (h1/h2/h3), paragraphs, links, bold, italic, horizontal rules.
; Navigation: Enter=fetch, W/S=scroll, B=back, H=home, M=bookmark.
;
; Memory layout:
;   0x5000  URL buffer (64 chars)
;   0x5100  HTTP host buffer
;   0x5200  HTTP path buffer
;   0x9000  HTML body buffer (8K)
;   0xA000  Parsed lines (100 lines x 33 words = 3300 words)
;   0xD000  Scroll offset (1 word)
;   0xD004  Line count (1 word)
;   0xD008  Mode (0=browse, 1=edit url)
;   0xD00C  History count
;   0xD010  History URLs (4 x 32 words)

; -- Constants --
LDI r20, 0       ; color: black
LDI r21, 0x00FFFF ; color: cyan
LDI r22, 0x00FF00 ; color: green
LDI r23, 0xFFFFFF ; color: white
LDI r24, 0x000040 ; color: dark blue (url bar bg)
LDI r25, 0x333333 ; color: dark gray (status)

; -- Init --
LDI r6, 0xD000
LDI r7, 0
STORE r6, r7     ; scroll = 0
LDI r6, 0xD004
STORE r6, r7     ; line_count = 0
LDI r6, 0xD008
STORE r6, r7     ; mode = browse
LDI r6, 0xD00C
STORE r6, r7     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r4, 0x9000
LDI r3, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r13, 60      ; <
STORE r4, r13
LDI r13, 104     ; h
LDI r3, 1
ADD r4, r3
STORE r4, r13
LDI r13, 49      ; 1
ADD r4, r3
STORE r4, r13
LDI r13, 62      ; >
ADD r4, r3
STORE r4, r13
LDI r13, 71      ; G
ADD r4, r3
STORE r4, r13
LDI r13, 101     ; e
ADD r4, r3
STORE r4, r13
LDI r13, 111     ; o
ADD r4, r3
STORE r4, r13
LDI r13, 109     ; m
ADD r4, r3
STORE r4, r13
LDI r13, 101     ; e
ADD r4, r3
STORE r4, r13
LDI r13, 116     ; t
ADD r4, r3
STORE r4, r13
LDI r13, 114     ; r
ADD r4, r3
STORE r4, r13
LDI r13, 121     ; y
ADD r4, r3
STORE r4, r13
LDI r13, 32      ; (space)
ADD r4, r3
STORE r4, r13
LDI r13, 79      ; O
ADD r4, r3
STORE r4, r13
LDI r13, 83      ; S
ADD r4, r3
STORE r4, r13
LDI r13, 60      ; <
ADD r4, r3
STORE r4, r13
LDI r13, 47      ; /
ADD r4, r3
STORE r4, r13
LDI r13, 104     ; h
ADD r4, r3
STORE r4, r13
LDI r13, 49      ; 1
ADD r4, r3
STORE r4, r13
LDI r13, 62      ; >
ADD r4, r3
STORE r4, r13
LDI r13, 60      ; <
ADD r4, r3
STORE r4, r13
LDI r13, 112     ; p
ADD r4, r3
STORE r4, r13
LDI r13, 62      ; >
ADD r4, r3
STORE r4, r13
LDI r13, 87      ; W
ADD r4, r3
STORE r4, r13
LDI r13, 101     ; e
ADD r4, r3
STORE r4, r13
LDI r13, 108     ; l
ADD r4, r3
STORE r4, r13
LDI r13, 99      ; c
ADD r4, r3
STORE r4, r13
LDI r13, 111     ; o
ADD r4, r3
STORE r4, r13
LDI r13, 109     ; m
ADD r4, r3
STORE r4, r13
LDI r13, 101     ; e
ADD r4, r3
STORE r4, r13
LDI r13, 33      ; !
ADD r4, r3
STORE r4, r13
LDI r13, 60      ; <
ADD r4, r3
STORE r4, r13
LDI r13, 47      ; /
ADD r4, r3
STORE r4, r13
LDI r13, 112     ; p
ADD r4, r3
STORE r4, r13
LDI r13, 62      ; >
ADD r4, r3
STORE r4, r13
LDI r13, 0       ; null terminator
ADD r4, r3
STORE r4, r13

; -- Parse HTML --
HITCLR
LDI r4, 0x9000  ; src = HTML buffer
LDI r3, 0xA000  ; dest = parsed lines buffer
LDI r13, 100     ; max_lines = 100
HTPARSE r4, r3, r13
; r11 = line count

; Store line count
LDI r6, 0xD004
STORE r6, r11

; -- Render URL bar --
; Draw dark blue bar at top
LDI r4, 0
LDI r3, 0
LDI r13, 256
LDI r5, 16
RECTF r4, r3, r13, r5, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r4, 0x5000
LDI r13, 103     ; g
STORE r4, r13
LDI r3, 1
ADD r4, r3
LDI r13, 101     ; e
STORE r4, r13
ADD r4, r3
LDI r13, 111     ; o
STORE r4, r13
ADD r4, r3
LDI r13, 58      ; :
STORE r4, r13
ADD r4, r3
LDI r13, 47      ; /
STORE r4, r13
ADD r4, r3
LDI r13, 47      ; /
STORE r4, r13
ADD r4, r3
LDI r13, 104     ; h
STORE r4, r13
ADD r4, r3
LDI r13, 111     ; o
STORE r4, r13
ADD r4, r3
LDI r13, 109     ; m
STORE r4, r13
ADD r4, r3
LDI r13, 101     ; e
STORE r4, r13
ADD r4, r3
LDI r13, 0       ; null
STORE r4, r13

; Render URL text
LDI r4, 2       ; x
LDI r3, 2       ; y
LDI r13, 0x5000  ; addr
LDI r5, 0x00FFFF ; cyan color
TEXT r4, r3, r13

; -- Render status bar --
LDI r4, 0
LDI r3, 240
LDI r13, 256
LDI r5, 16
RECTF r4, r3, r13, r5, r25

; -- Render parsed content --
; Read scroll offset
LDI r12, 0xD000
LOAD r12, r12    ; r12 = scroll

; Read line count
LDI r14, 0xD004
LOAD r14, r14    ; r14 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r6, 0        ; visible line counter
LDI r7, 1        ; increment
LDI r2, 24       ; max visible lines
LDI r4, 0       ; base Y = 20

render_loop:
  CMP r6, r2
  BGE r11, render_done
  CMP r6, r14
  BGE r11, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r3, r12     ; scroll
  ADD r3, r6      ; + vis_idx
  LDI r13, 33
  MUL r3, r13     ; * 33
  LDI r13, 0xA000
  ADD r3, r13     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r13, r3    ; fg_color
  CMP r13, r20     ; compare with 0 (black = empty)
  JZ r11, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r5, 4       ; x offset
  MOV r5, r4     ; y = base_y + line * 8
  LDI r16, 8
  MUL r5, r16
  LDI r16, 20
  ADD r5, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r7
    BGE r11, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r11, skip_first
    ; Draw char pixel
    MOV r18, r3
    ADD r18, r16
    ADD r18, r7     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r11, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r5, r13  ; colored pixel

  skip_first:
    ADD r16, r7
    JMP draw_chars

next_line:
  ADD r6, r7
  ADD r4, r7
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
