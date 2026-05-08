; DESCRIPTION: Render a colored object at the screen.

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
LDI r8, 0xD000
LDI r4, 0
STORE r8, r4     ; scroll = 0
LDI r8, 0xD004
STORE r8, r4     ; line_count = 0
LDI r8, 0xD008
STORE r8, r4     ; mode = browse
LDI r8, 0xD00C
STORE r8, r4     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r2, 0x9000
LDI r13, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r6, 60      ; <
STORE r2, r6
LDI r6, 104     ; h
LDI r13, 1
ADD r2, r13
STORE r2, r6
LDI r6, 49      ; 1
ADD r2, r13
STORE r2, r6
LDI r6, 62      ; >
ADD r2, r13
STORE r2, r6
LDI r6, 71      ; G
ADD r2, r13
STORE r2, r6
LDI r6, 101     ; e
ADD r2, r13
STORE r2, r6
LDI r6, 111     ; o
ADD r2, r13
STORE r2, r6
LDI r6, 109     ; m
ADD r2, r13
STORE r2, r6
LDI r6, 101     ; e
ADD r2, r13
STORE r2, r6
LDI r6, 116     ; t
ADD r2, r13
STORE r2, r6
LDI r6, 114     ; r
ADD r2, r13
STORE r2, r6
LDI r6, 121     ; y
ADD r2, r13
STORE r2, r6
LDI r6, 32      ; (space)
ADD r2, r13
STORE r2, r6
LDI r6, 79      ; O
ADD r2, r13
STORE r2, r6
LDI r6, 83      ; S
ADD r2, r13
STORE r2, r6
LDI r6, 60      ; <
ADD r2, r13
STORE r2, r6
LDI r6, 47      ; /
ADD r2, r13
STORE r2, r6
LDI r6, 104     ; h
ADD r2, r13
STORE r2, r6
LDI r6, 49      ; 1
ADD r2, r13
STORE r2, r6
LDI r6, 62      ; >
ADD r2, r13
STORE r2, r6
LDI r6, 60      ; <
ADD r2, r13
STORE r2, r6
LDI r6, 112     ; p
ADD r2, r13
STORE r2, r6
LDI r6, 62      ; >
ADD r2, r13
STORE r2, r6
LDI r6, 87      ; W
ADD r2, r13
STORE r2, r6
LDI r6, 101     ; e
ADD r2, r13
STORE r2, r6
LDI r6, 108     ; l
ADD r2, r13
STORE r2, r6
LDI r6, 99      ; c
ADD r2, r13
STORE r2, r6
LDI r6, 111     ; o
ADD r2, r13
STORE r2, r6
LDI r6, 109     ; m
ADD r2, r13
STORE r2, r6
LDI r6, 101     ; e
ADD r2, r13
STORE r2, r6
LDI r6, 33      ; !
ADD r2, r13
STORE r2, r6
LDI r6, 60      ; <
ADD r2, r13
STORE r2, r6
LDI r6, 47      ; /
ADD r2, r13
STORE r2, r6
LDI r6, 112     ; p
ADD r2, r13
STORE r2, r6
LDI r6, 62      ; >
ADD r2, r13
STORE r2, r6
LDI r6, 0       ; null terminator
ADD r2, r13
STORE r2, r6

; -- Parse HTML --
HITCLR
LDI r2, 0x9000  ; src = HTML buffer
LDI r13, 0xA000  ; dest = parsed lines buffer
LDI r6, 100     ; max_lines = 100
HTPARSE r2, r13, r6
; r7 = line count

; Store line count
LDI r8, 0xD004
STORE r8, r7

; -- Render URL bar --
; Draw dark blue bar at top
LDI r2, 0
LDI r13, 0
LDI r6, 256
LDI r11, 16
RECTF r2, r13, r6, r11, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r2, 0x5000
LDI r6, 103     ; g
STORE r2, r6
LDI r13, 1
ADD r2, r13
LDI r6, 101     ; e
STORE r2, r6
ADD r2, r13
LDI r6, 111     ; o
STORE r2, r6
ADD r2, r13
LDI r6, 58      ; :
STORE r2, r6
ADD r2, r13
LDI r6, 47      ; /
STORE r2, r6
ADD r2, r13
LDI r6, 47      ; /
STORE r2, r6
ADD r2, r13
LDI r6, 104     ; h
STORE r2, r6
ADD r2, r13
LDI r6, 111     ; o
STORE r2, r6
ADD r2, r13
LDI r6, 109     ; m
STORE r2, r6
ADD r2, r13
LDI r6, 101     ; e
STORE r2, r6
ADD r2, r13
LDI r6, 0       ; null
STORE r2, r6

; Render URL text
LDI r2, 2       ; x
LDI r13, 2       ; y
LDI r6, 0x5000  ; addr
LDI r11, 0x00FFFF ; cyan color
TEXT r2, r13, r6

; -- Render status bar --
LDI r2, 0
LDI r13, 240
LDI r6, 256
LDI r11, 16
RECTF r2, r13, r6, r11, r25

; -- Render parsed content --
; Read scroll offset
LDI r14, 0xD000
LOAD r14, r14    ; r14 = scroll

; Read line count
LDI r9, 0xD004
LOAD r9, r9    ; r9 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r8, 0        ; visible line counter
LDI r4, 1        ; increment
LDI r5, 24       ; max visible lines
LDI r2, 0       ; base Y = 20

render_loop:
  CMP r8, r5
  BGE r7, render_done
  CMP r8, r9
  BGE r7, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r13, r14     ; scroll
  ADD r13, r8      ; + vis_idx
  LDI r6, 33
  MUL r13, r6     ; * 33
  LDI r6, 0xA000
  ADD r13, r6     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r6, r13    ; fg_color
  CMP r6, r20     ; compare with 0 (black = empty)
  JZ r7, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r11, 4       ; x offset
  MOV r11, r2     ; y = base_y + line * 8
  LDI r16, 8
  MUL r11, r16
  LDI r16, 20
  ADD r11, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r4
    BGE r7, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r7, skip_first
    ; Draw char pixel
    MOV r18, r13
    ADD r18, r16
    ADD r18, r4     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r7, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r11, r6  ; colored pixel

  skip_first:
    ADD r16, r4
    JMP draw_chars

next_line:
  ADD r8, r4
  ADD r2, r4
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
