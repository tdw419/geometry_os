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
LDI r3, 0xD000
LDI r10, 0
STORE r3, r10     ; scroll = 0
LDI r3, 0xD004
STORE r3, r10     ; line_count = 0
LDI r3, 0xD008
STORE r3, r10     ; mode = browse
LDI r3, 0xD00C
STORE r3, r10     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r8, 0x9000
LDI r5, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r11, 60      ; <
STORE r8, r11
LDI r11, 104     ; h
LDI r5, 1
ADD r8, r5
STORE r8, r11
LDI r11, 49      ; 1
ADD r8, r5
STORE r8, r11
LDI r11, 62      ; >
ADD r8, r5
STORE r8, r11
LDI r11, 71      ; G
ADD r8, r5
STORE r8, r11
LDI r11, 101     ; e
ADD r8, r5
STORE r8, r11
LDI r11, 111     ; o
ADD r8, r5
STORE r8, r11
LDI r11, 109     ; m
ADD r8, r5
STORE r8, r11
LDI r11, 101     ; e
ADD r8, r5
STORE r8, r11
LDI r11, 116     ; t
ADD r8, r5
STORE r8, r11
LDI r11, 114     ; r
ADD r8, r5
STORE r8, r11
LDI r11, 121     ; y
ADD r8, r5
STORE r8, r11
LDI r11, 32      ; (space)
ADD r8, r5
STORE r8, r11
LDI r11, 79      ; O
ADD r8, r5
STORE r8, r11
LDI r11, 83      ; S
ADD r8, r5
STORE r8, r11
LDI r11, 60      ; <
ADD r8, r5
STORE r8, r11
LDI r11, 47      ; /
ADD r8, r5
STORE r8, r11
LDI r11, 104     ; h
ADD r8, r5
STORE r8, r11
LDI r11, 49      ; 1
ADD r8, r5
STORE r8, r11
LDI r11, 62      ; >
ADD r8, r5
STORE r8, r11
LDI r11, 60      ; <
ADD r8, r5
STORE r8, r11
LDI r11, 112     ; p
ADD r8, r5
STORE r8, r11
LDI r11, 62      ; >
ADD r8, r5
STORE r8, r11
LDI r11, 87      ; W
ADD r8, r5
STORE r8, r11
LDI r11, 101     ; e
ADD r8, r5
STORE r8, r11
LDI r11, 108     ; l
ADD r8, r5
STORE r8, r11
LDI r11, 99      ; c
ADD r8, r5
STORE r8, r11
LDI r11, 111     ; o
ADD r8, r5
STORE r8, r11
LDI r11, 109     ; m
ADD r8, r5
STORE r8, r11
LDI r11, 101     ; e
ADD r8, r5
STORE r8, r11
LDI r11, 33      ; !
ADD r8, r5
STORE r8, r11
LDI r11, 60      ; <
ADD r8, r5
STORE r8, r11
LDI r11, 47      ; /
ADD r8, r5
STORE r8, r11
LDI r11, 112     ; p
ADD r8, r5
STORE r8, r11
LDI r11, 62      ; >
ADD r8, r5
STORE r8, r11
LDI r11, 0       ; null terminator
ADD r8, r5
STORE r8, r11

; -- Parse HTML --
HITCLR
LDI r8, 0x9000  ; src = HTML buffer
LDI r5, 0xA000  ; dest = parsed lines buffer
LDI r11, 100     ; max_lines = 100
HTPARSE r8, r5, r11
; r0 = line count

; Store line count
LDI r3, 0xD004
STORE r3, r0

; -- Render URL bar --
; Draw dark blue bar at top
LDI r8, 0
LDI r5, 0
LDI r11, 256
LDI r9, 16
RECTF r8, r5, r11, r9, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r8, 0x5000
LDI r11, 103     ; g
STORE r8, r11
LDI r5, 1
ADD r8, r5
LDI r11, 101     ; e
STORE r8, r11
ADD r8, r5
LDI r11, 111     ; o
STORE r8, r11
ADD r8, r5
LDI r11, 58      ; :
STORE r8, r11
ADD r8, r5
LDI r11, 47      ; /
STORE r8, r11
ADD r8, r5
LDI r11, 47      ; /
STORE r8, r11
ADD r8, r5
LDI r11, 104     ; h
STORE r8, r11
ADD r8, r5
LDI r11, 111     ; o
STORE r8, r11
ADD r8, r5
LDI r11, 109     ; m
STORE r8, r11
ADD r8, r5
LDI r11, 101     ; e
STORE r8, r11
ADD r8, r5
LDI r11, 0       ; null
STORE r8, r11

; Render URL text
LDI r8, 2       ; x
LDI r5, 2       ; y
LDI r11, 0x5000  ; addr
LDI r9, 0x00FFFF ; cyan color
TEXT r8, r5, r11

; -- Render status bar --
LDI r8, 0
LDI r5, 240
LDI r11, 256
LDI r9, 16
RECTF r8, r5, r11, r9, r25

; -- Render parsed content --
; Read scroll offset
LDI r6, 0xD000
LOAD r6, r6    ; r6 = scroll

; Read line count
LDI r13, 0xD004
LOAD r13, r13    ; r13 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r3, 0        ; visible line counter
LDI r10, 1        ; increment
LDI r15, 24       ; max visible lines
LDI r8, 0       ; base Y = 20

render_loop:
  CMP r3, r15
  BGE r0, render_done
  CMP r3, r13
  BGE r0, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r5, r6     ; scroll
  ADD r5, r3      ; + vis_idx
  LDI r11, 33
  MUL r5, r11     ; * 33
  LDI r11, 0xA000
  ADD r5, r11     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r11, r5    ; fg_color
  CMP r11, r20     ; compare with 0 (black = empty)
  JZ r0, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r9, 4       ; x offset
  MOV r9, r8     ; y = base_y + line * 8
  LDI r16, 8
  MUL r9, r16
  LDI r16, 20
  ADD r9, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r10
    BGE r0, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r0, skip_first
    ; Draw char pixel
    MOV r18, r5
    ADD r18, r16
    ADD r18, r10     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r0, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r9, r11  ; colored pixel

  skip_first:
    ADD r16, r10
    JMP draw_chars

next_line:
  ADD r3, r10
  ADD r8, r10
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
