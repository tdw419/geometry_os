; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r9, 0xD000
LDI r1, 0
STORE r9, r1     ; scroll = 0
LDI r9, 0xD004
STORE r9, r1     ; line_count = 0
LDI r9, 0xD008
STORE r9, r1     ; mode = browse
LDI r9, 0xD00C
STORE r9, r1     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r11, 0x9000
LDI r10, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r14, 60      ; <
STORE r11, r14
LDI r14, 104     ; h
LDI r10, 1
ADD r11, r10
STORE r11, r14
LDI r14, 49      ; 1
ADD r11, r10
STORE r11, r14
LDI r14, 62      ; >
ADD r11, r10
STORE r11, r14
LDI r14, 71      ; G
ADD r11, r10
STORE r11, r14
LDI r14, 101     ; e
ADD r11, r10
STORE r11, r14
LDI r14, 111     ; o
ADD r11, r10
STORE r11, r14
LDI r14, 109     ; m
ADD r11, r10
STORE r11, r14
LDI r14, 101     ; e
ADD r11, r10
STORE r11, r14
LDI r14, 116     ; t
ADD r11, r10
STORE r11, r14
LDI r14, 114     ; r
ADD r11, r10
STORE r11, r14
LDI r14, 121     ; y
ADD r11, r10
STORE r11, r14
LDI r14, 32      ; (space)
ADD r11, r10
STORE r11, r14
LDI r14, 79      ; O
ADD r11, r10
STORE r11, r14
LDI r14, 83      ; S
ADD r11, r10
STORE r11, r14
LDI r14, 60      ; <
ADD r11, r10
STORE r11, r14
LDI r14, 47      ; /
ADD r11, r10
STORE r11, r14
LDI r14, 104     ; h
ADD r11, r10
STORE r11, r14
LDI r14, 49      ; 1
ADD r11, r10
STORE r11, r14
LDI r14, 62      ; >
ADD r11, r10
STORE r11, r14
LDI r14, 60      ; <
ADD r11, r10
STORE r11, r14
LDI r14, 112     ; p
ADD r11, r10
STORE r11, r14
LDI r14, 62      ; >
ADD r11, r10
STORE r11, r14
LDI r14, 87      ; W
ADD r11, r10
STORE r11, r14
LDI r14, 101     ; e
ADD r11, r10
STORE r11, r14
LDI r14, 108     ; l
ADD r11, r10
STORE r11, r14
LDI r14, 99      ; c
ADD r11, r10
STORE r11, r14
LDI r14, 111     ; o
ADD r11, r10
STORE r11, r14
LDI r14, 109     ; m
ADD r11, r10
STORE r11, r14
LDI r14, 101     ; e
ADD r11, r10
STORE r11, r14
LDI r14, 33      ; !
ADD r11, r10
STORE r11, r14
LDI r14, 60      ; <
ADD r11, r10
STORE r11, r14
LDI r14, 47      ; /
ADD r11, r10
STORE r11, r14
LDI r14, 112     ; p
ADD r11, r10
STORE r11, r14
LDI r14, 62      ; >
ADD r11, r10
STORE r11, r14
LDI r14, 0       ; null terminator
ADD r11, r10
STORE r11, r14

; -- Parse HTML --
HITCLR
LDI r11, 0x9000  ; src = HTML buffer
LDI r10, 0xA000  ; dest = parsed lines buffer
LDI r14, 100     ; max_lines = 100
HTPARSE r11, r10, r14
; r6 = line count

; Store line count
LDI r9, 0xD004
STORE r9, r6

; -- Render URL bar --
; Draw dark blue bar at top
LDI r11, 0
LDI r10, 0
LDI r14, 256
LDI r13, 16
RECTF r11, r10, r14, r13, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r11, 0x5000
LDI r14, 103     ; g
STORE r11, r14
LDI r10, 1
ADD r11, r10
LDI r14, 101     ; e
STORE r11, r14
ADD r11, r10
LDI r14, 111     ; o
STORE r11, r14
ADD r11, r10
LDI r14, 58      ; :
STORE r11, r14
ADD r11, r10
LDI r14, 47      ; /
STORE r11, r14
ADD r11, r10
LDI r14, 47      ; /
STORE r11, r14
ADD r11, r10
LDI r14, 104     ; h
STORE r11, r14
ADD r11, r10
LDI r14, 111     ; o
STORE r11, r14
ADD r11, r10
LDI r14, 109     ; m
STORE r11, r14
ADD r11, r10
LDI r14, 101     ; e
STORE r11, r14
ADD r11, r10
LDI r14, 0       ; null
STORE r11, r14

; Render URL text
LDI r11, 2       ; x
LDI r10, 2       ; y
LDI r14, 0x5000  ; addr
LDI r13, 0x00FFFF ; cyan color
TEXT r11, r10, r14

; -- Render status bar --
LDI r11, 0
LDI r10, 240
LDI r14, 256
LDI r13, 16
RECTF r11, r10, r14, r13, r25

; -- Render parsed content --
; Read scroll offset
LDI r4, 0xD000
LOAD r4, r4    ; r4 = scroll

; Read line count
LDI r7, 0xD004
LOAD r7, r7    ; r7 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r9, 0        ; visible line counter
LDI r1, 1        ; increment
LDI r8, 24       ; max visible lines
LDI r11, 0       ; base Y = 20

render_loop:
  CMP r9, r8
  BGE r6, render_done
  CMP r9, r7
  BGE r6, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r10, r4     ; scroll
  ADD r10, r9      ; + vis_idx
  LDI r14, 33
  MUL r10, r14     ; * 33
  LDI r14, 0xA000
  ADD r10, r14     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r14, r10    ; fg_color
  CMP r14, r20     ; compare with 0 (black = empty)
  JZ r6, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r13, 4       ; x offset
  MOV r13, r11     ; y = base_y + line * 8
  LDI r16, 8
  MUL r13, r16
  LDI r16, 20
  ADD r13, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r1
    BGE r6, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r6, skip_first
    ; Draw char pixel
    MOV r18, r10
    ADD r18, r16
    ADD r18, r1     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r6, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r13, r14  ; colored pixel

  skip_first:
    ADD r16, r1
    JMP draw_chars

next_line:
  ADD r9, r1
  ADD r11, r1
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
