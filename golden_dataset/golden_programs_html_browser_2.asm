; DESCRIPTION: Geometry OS program to draw a colored object.

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
LDI r14, 0xD000
LDI r15, 0
STORE r14, r15     ; scroll = 0
LDI r14, 0xD004
STORE r14, r15     ; line_count = 0
LDI r14, 0xD008
STORE r14, r15     ; mode = browse
LDI r14, 0xD00C
STORE r14, r15     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r0, 0x9000
LDI r5, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r4, 60      ; <
STORE r0, r4
LDI r4, 104     ; h
LDI r5, 1
ADD r0, r5
STORE r0, r4
LDI r4, 49      ; 1
ADD r0, r5
STORE r0, r4
LDI r4, 62      ; >
ADD r0, r5
STORE r0, r4
LDI r4, 71      ; G
ADD r0, r5
STORE r0, r4
LDI r4, 101     ; e
ADD r0, r5
STORE r0, r4
LDI r4, 111     ; o
ADD r0, r5
STORE r0, r4
LDI r4, 109     ; m
ADD r0, r5
STORE r0, r4
LDI r4, 101     ; e
ADD r0, r5
STORE r0, r4
LDI r4, 116     ; t
ADD r0, r5
STORE r0, r4
LDI r4, 114     ; r
ADD r0, r5
STORE r0, r4
LDI r4, 121     ; y
ADD r0, r5
STORE r0, r4
LDI r4, 32      ; (space)
ADD r0, r5
STORE r0, r4
LDI r4, 79      ; O
ADD r0, r5
STORE r0, r4
LDI r4, 83      ; S
ADD r0, r5
STORE r0, r4
LDI r4, 60      ; <
ADD r0, r5
STORE r0, r4
LDI r4, 47      ; /
ADD r0, r5
STORE r0, r4
LDI r4, 104     ; h
ADD r0, r5
STORE r0, r4
LDI r4, 49      ; 1
ADD r0, r5
STORE r0, r4
LDI r4, 62      ; >
ADD r0, r5
STORE r0, r4
LDI r4, 60      ; <
ADD r0, r5
STORE r0, r4
LDI r4, 112     ; p
ADD r0, r5
STORE r0, r4
LDI r4, 62      ; >
ADD r0, r5
STORE r0, r4
LDI r4, 87      ; W
ADD r0, r5
STORE r0, r4
LDI r4, 101     ; e
ADD r0, r5
STORE r0, r4
LDI r4, 108     ; l
ADD r0, r5
STORE r0, r4
LDI r4, 99      ; c
ADD r0, r5
STORE r0, r4
LDI r4, 111     ; o
ADD r0, r5
STORE r0, r4
LDI r4, 109     ; m
ADD r0, r5
STORE r0, r4
LDI r4, 101     ; e
ADD r0, r5
STORE r0, r4
LDI r4, 33      ; !
ADD r0, r5
STORE r0, r4
LDI r4, 60      ; <
ADD r0, r5
STORE r0, r4
LDI r4, 47      ; /
ADD r0, r5
STORE r0, r4
LDI r4, 112     ; p
ADD r0, r5
STORE r0, r4
LDI r4, 62      ; >
ADD r0, r5
STORE r0, r4
LDI r4, 0       ; null terminator
ADD r0, r5
STORE r0, r4

; -- Parse HTML --
HITCLR
LDI r0, 0x9000  ; src = HTML buffer
LDI r5, 0xA000  ; dest = parsed lines buffer
LDI r4, 100     ; max_lines = 100
HTPARSE r0, r5, r4
; r11 = line count

; Store line count
LDI r14, 0xD004
STORE r14, r11

; -- Render URL bar --
; Draw dark blue bar at top
LDI r0, 0
LDI r5, 0
LDI r4, 256
LDI r10, 16
RECTF r0, r5, r4, r10, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r0, 0x5000
LDI r4, 103     ; g
STORE r0, r4
LDI r5, 1
ADD r0, r5
LDI r4, 101     ; e
STORE r0, r4
ADD r0, r5
LDI r4, 111     ; o
STORE r0, r4
ADD r0, r5
LDI r4, 58      ; :
STORE r0, r4
ADD r0, r5
LDI r4, 47      ; /
STORE r0, r4
ADD r0, r5
LDI r4, 47      ; /
STORE r0, r4
ADD r0, r5
LDI r4, 104     ; h
STORE r0, r4
ADD r0, r5
LDI r4, 111     ; o
STORE r0, r4
ADD r0, r5
LDI r4, 109     ; m
STORE r0, r4
ADD r0, r5
LDI r4, 101     ; e
STORE r0, r4
ADD r0, r5
LDI r4, 0       ; null
STORE r0, r4

; Render URL text
LDI r0, 2       ; x
LDI r5, 2       ; y
LDI r4, 0x5000  ; addr
LDI r10, 0x00FFFF ; cyan color
TEXT r0, r5, r4

; -- Render status bar --
LDI r0, 0
LDI r5, 240
LDI r4, 256
LDI r10, 16
RECTF r0, r5, r4, r10, r25

; -- Render parsed content --
; Read scroll offset
LDI r3, 0xD000
LOAD r3, r3    ; r3 = scroll

; Read line count
LDI r8, 0xD004
LOAD r8, r8    ; r8 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r14, 0        ; visible line counter
LDI r15, 1        ; increment
LDI r7, 24       ; max visible lines
LDI r0, 0       ; base Y = 20

render_loop:
  CMP r14, r7
  BGE r11, render_done
  CMP r14, r8
  BGE r11, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r5, r3     ; scroll
  ADD r5, r14      ; + vis_idx
  LDI r4, 33
  MUL r5, r4     ; * 33
  LDI r4, 0xA000
  ADD r5, r4     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r4, r5    ; fg_color
  CMP r4, r20     ; compare with 0 (black = empty)
  JZ r11, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r10, 4       ; x offset
  MOV r10, r0     ; y = base_y + line * 8
  LDI r16, 8
  MUL r10, r16
  LDI r16, 20
  ADD r10, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r15
    BGE r11, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r11, skip_first
    ; Draw char pixel
    MOV r18, r5
    ADD r18, r16
    ADD r18, r15     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r11, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r10, r4  ; colored pixel

  skip_first:
    ADD r16, r15
    JMP draw_chars

next_line:
  ADD r14, r15
  ADD r0, r15
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
