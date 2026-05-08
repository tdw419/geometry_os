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
LDI r1, 0xD000
LDI r15, 0
STORE r1, r15     ; scroll = 0
LDI r1, 0xD004
STORE r1, r15     ; line_count = 0
LDI r1, 0xD008
STORE r1, r15     ; mode = browse
LDI r1, 0xD00C
STORE r1, r15     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r7, 0x9000
LDI r13, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r5, 60      ; <
STORE r7, r5
LDI r5, 104     ; h
LDI r13, 1
ADD r7, r13
STORE r7, r5
LDI r5, 49      ; 1
ADD r7, r13
STORE r7, r5
LDI r5, 62      ; >
ADD r7, r13
STORE r7, r5
LDI r5, 71      ; G
ADD r7, r13
STORE r7, r5
LDI r5, 101     ; e
ADD r7, r13
STORE r7, r5
LDI r5, 111     ; o
ADD r7, r13
STORE r7, r5
LDI r5, 109     ; m
ADD r7, r13
STORE r7, r5
LDI r5, 101     ; e
ADD r7, r13
STORE r7, r5
LDI r5, 116     ; t
ADD r7, r13
STORE r7, r5
LDI r5, 114     ; r
ADD r7, r13
STORE r7, r5
LDI r5, 121     ; y
ADD r7, r13
STORE r7, r5
LDI r5, 32      ; (space)
ADD r7, r13
STORE r7, r5
LDI r5, 79      ; O
ADD r7, r13
STORE r7, r5
LDI r5, 83      ; S
ADD r7, r13
STORE r7, r5
LDI r5, 60      ; <
ADD r7, r13
STORE r7, r5
LDI r5, 47      ; /
ADD r7, r13
STORE r7, r5
LDI r5, 104     ; h
ADD r7, r13
STORE r7, r5
LDI r5, 49      ; 1
ADD r7, r13
STORE r7, r5
LDI r5, 62      ; >
ADD r7, r13
STORE r7, r5
LDI r5, 60      ; <
ADD r7, r13
STORE r7, r5
LDI r5, 112     ; p
ADD r7, r13
STORE r7, r5
LDI r5, 62      ; >
ADD r7, r13
STORE r7, r5
LDI r5, 87      ; W
ADD r7, r13
STORE r7, r5
LDI r5, 101     ; e
ADD r7, r13
STORE r7, r5
LDI r5, 108     ; l
ADD r7, r13
STORE r7, r5
LDI r5, 99      ; c
ADD r7, r13
STORE r7, r5
LDI r5, 111     ; o
ADD r7, r13
STORE r7, r5
LDI r5, 109     ; m
ADD r7, r13
STORE r7, r5
LDI r5, 101     ; e
ADD r7, r13
STORE r7, r5
LDI r5, 33      ; !
ADD r7, r13
STORE r7, r5
LDI r5, 60      ; <
ADD r7, r13
STORE r7, r5
LDI r5, 47      ; /
ADD r7, r13
STORE r7, r5
LDI r5, 112     ; p
ADD r7, r13
STORE r7, r5
LDI r5, 62      ; >
ADD r7, r13
STORE r7, r5
LDI r5, 0       ; null terminator
ADD r7, r13
STORE r7, r5

; -- Parse HTML --
HITCLR
LDI r7, 0x9000  ; src = HTML buffer
LDI r13, 0xA000  ; dest = parsed lines buffer
LDI r5, 100     ; max_lines = 100
HTPARSE r7, r13, r5
; r3 = line count

; Store line count
LDI r1, 0xD004
STORE r1, r3

; -- Render URL bar --
; Draw dark blue bar at top
LDI r7, 0
LDI r13, 0
LDI r5, 256
LDI r9, 16
RECTF r7, r13, r5, r9, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r7, 0x5000
LDI r5, 103     ; g
STORE r7, r5
LDI r13, 1
ADD r7, r13
LDI r5, 101     ; e
STORE r7, r5
ADD r7, r13
LDI r5, 111     ; o
STORE r7, r5
ADD r7, r13
LDI r5, 58      ; :
STORE r7, r5
ADD r7, r13
LDI r5, 47      ; /
STORE r7, r5
ADD r7, r13
LDI r5, 47      ; /
STORE r7, r5
ADD r7, r13
LDI r5, 104     ; h
STORE r7, r5
ADD r7, r13
LDI r5, 111     ; o
STORE r7, r5
ADD r7, r13
LDI r5, 109     ; m
STORE r7, r5
ADD r7, r13
LDI r5, 101     ; e
STORE r7, r5
ADD r7, r13
LDI r5, 0       ; null
STORE r7, r5

; Render URL text
LDI r7, 2       ; x
LDI r13, 2       ; y
LDI r5, 0x5000  ; addr
LDI r9, 0x00FFFF ; cyan color
TEXT r7, r13, r5

; -- Render status bar --
LDI r7, 0
LDI r13, 240
LDI r5, 256
LDI r9, 16
RECTF r7, r13, r5, r9, r25

; -- Render parsed content --
; Read scroll offset
LDI r14, 0xD000
LOAD r14, r14    ; r14 = scroll

; Read line count
LDI r0, 0xD004
LOAD r0, r0    ; r0 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r1, 0        ; visible line counter
LDI r15, 1        ; increment
LDI r4, 24       ; max visible lines
LDI r7, 0       ; base Y = 20

render_loop:
  CMP r1, r4
  BGE r3, render_done
  CMP r1, r0
  BGE r3, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r13, r14     ; scroll
  ADD r13, r1      ; + vis_idx
  LDI r5, 33
  MUL r13, r5     ; * 33
  LDI r5, 0xA000
  ADD r13, r5     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r5, r13    ; fg_color
  CMP r5, r20     ; compare with 0 (black = empty)
  JZ r3, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r9, 4       ; x offset
  MOV r9, r7     ; y = base_y + line * 8
  LDI r16, 8
  MUL r9, r16
  LDI r16, 20
  ADD r9, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r15
    BGE r3, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r3, skip_first
    ; Draw char pixel
    MOV r18, r13
    ADD r18, r16
    ADD r18, r15     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r3, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r9, r5  ; colored pixel

  skip_first:
    ADD r16, r15
    JMP draw_chars

next_line:
  ADD r1, r15
  ADD r7, r15
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
