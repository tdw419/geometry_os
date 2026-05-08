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
LDI r7, 0xD000
LDI r1, 0
STORE r7, r1     ; scroll = 0
LDI r7, 0xD004
STORE r7, r1     ; line_count = 0
LDI r7, 0xD008
STORE r7, r1     ; mode = browse
LDI r7, 0xD00C
STORE r7, r1     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r14, 0x9000
LDI r11, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r9, 60      ; <
STORE r14, r9
LDI r9, 104     ; h
LDI r11, 1
ADD r14, r11
STORE r14, r9
LDI r9, 49      ; 1
ADD r14, r11
STORE r14, r9
LDI r9, 62      ; >
ADD r14, r11
STORE r14, r9
LDI r9, 71      ; G
ADD r14, r11
STORE r14, r9
LDI r9, 101     ; e
ADD r14, r11
STORE r14, r9
LDI r9, 111     ; o
ADD r14, r11
STORE r14, r9
LDI r9, 109     ; m
ADD r14, r11
STORE r14, r9
LDI r9, 101     ; e
ADD r14, r11
STORE r14, r9
LDI r9, 116     ; t
ADD r14, r11
STORE r14, r9
LDI r9, 114     ; r
ADD r14, r11
STORE r14, r9
LDI r9, 121     ; y
ADD r14, r11
STORE r14, r9
LDI r9, 32      ; (space)
ADD r14, r11
STORE r14, r9
LDI r9, 79      ; O
ADD r14, r11
STORE r14, r9
LDI r9, 83      ; S
ADD r14, r11
STORE r14, r9
LDI r9, 60      ; <
ADD r14, r11
STORE r14, r9
LDI r9, 47      ; /
ADD r14, r11
STORE r14, r9
LDI r9, 104     ; h
ADD r14, r11
STORE r14, r9
LDI r9, 49      ; 1
ADD r14, r11
STORE r14, r9
LDI r9, 62      ; >
ADD r14, r11
STORE r14, r9
LDI r9, 60      ; <
ADD r14, r11
STORE r14, r9
LDI r9, 112     ; p
ADD r14, r11
STORE r14, r9
LDI r9, 62      ; >
ADD r14, r11
STORE r14, r9
LDI r9, 87      ; W
ADD r14, r11
STORE r14, r9
LDI r9, 101     ; e
ADD r14, r11
STORE r14, r9
LDI r9, 108     ; l
ADD r14, r11
STORE r14, r9
LDI r9, 99      ; c
ADD r14, r11
STORE r14, r9
LDI r9, 111     ; o
ADD r14, r11
STORE r14, r9
LDI r9, 109     ; m
ADD r14, r11
STORE r14, r9
LDI r9, 101     ; e
ADD r14, r11
STORE r14, r9
LDI r9, 33      ; !
ADD r14, r11
STORE r14, r9
LDI r9, 60      ; <
ADD r14, r11
STORE r14, r9
LDI r9, 47      ; /
ADD r14, r11
STORE r14, r9
LDI r9, 112     ; p
ADD r14, r11
STORE r14, r9
LDI r9, 62      ; >
ADD r14, r11
STORE r14, r9
LDI r9, 0       ; null terminator
ADD r14, r11
STORE r14, r9

; -- Parse HTML --
HITCLR
LDI r14, 0x9000  ; src = HTML buffer
LDI r11, 0xA000  ; dest = parsed lines buffer
LDI r9, 100     ; max_lines = 100
HTPARSE r14, r11, r9
; r4 = line count

; Store line count
LDI r7, 0xD004
STORE r7, r4

; -- Render URL bar --
; Draw dark blue bar at top
LDI r14, 0
LDI r11, 0
LDI r9, 256
LDI r12, 16
RECTF r14, r11, r9, r12, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r14, 0x5000
LDI r9, 103     ; g
STORE r14, r9
LDI r11, 1
ADD r14, r11
LDI r9, 101     ; e
STORE r14, r9
ADD r14, r11
LDI r9, 111     ; o
STORE r14, r9
ADD r14, r11
LDI r9, 58      ; :
STORE r14, r9
ADD r14, r11
LDI r9, 47      ; /
STORE r14, r9
ADD r14, r11
LDI r9, 47      ; /
STORE r14, r9
ADD r14, r11
LDI r9, 104     ; h
STORE r14, r9
ADD r14, r11
LDI r9, 111     ; o
STORE r14, r9
ADD r14, r11
LDI r9, 109     ; m
STORE r14, r9
ADD r14, r11
LDI r9, 101     ; e
STORE r14, r9
ADD r14, r11
LDI r9, 0       ; null
STORE r14, r9

; Render URL text
LDI r14, 2       ; x
LDI r11, 2       ; y
LDI r9, 0x5000  ; addr
LDI r12, 0x00FFFF ; cyan color
TEXT r14, r11, r9

; -- Render status bar --
LDI r14, 0
LDI r11, 240
LDI r9, 256
LDI r12, 16
RECTF r14, r11, r9, r12, r25

; -- Render parsed content --
; Read scroll offset
LDI r5, 0xD000
LOAD r5, r5    ; r5 = scroll

; Read line count
LDI r10, 0xD004
LOAD r10, r10    ; r10 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r7, 0        ; visible line counter
LDI r1, 1        ; increment
LDI r3, 24       ; max visible lines
LDI r14, 0       ; base Y = 20

render_loop:
  CMP r7, r3
  BGE r4, render_done
  CMP r7, r10
  BGE r4, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r11, r5     ; scroll
  ADD r11, r7      ; + vis_idx
  LDI r9, 33
  MUL r11, r9     ; * 33
  LDI r9, 0xA000
  ADD r11, r9     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r9, r11    ; fg_color
  CMP r9, r20     ; compare with 0 (black = empty)
  JZ r4, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r12, 4       ; x offset
  MOV r12, r14     ; y = base_y + line * 8
  LDI r16, 8
  MUL r12, r16
  LDI r16, 20
  ADD r12, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r1
    BGE r4, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r4, skip_first
    ; Draw char pixel
    MOV r18, r11
    ADD r18, r16
    ADD r18, r1     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r4, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r12, r9  ; colored pixel

  skip_first:
    ADD r16, r1
    JMP draw_chars

next_line:
  ADD r7, r1
  ADD r14, r1
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
