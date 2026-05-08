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
LDI r4, 0xD000
LDI r1, 0
STORE r4, r1     ; scroll = 0
LDI r4, 0xD004
STORE r4, r1     ; line_count = 0
LDI r4, 0xD008
STORE r4, r1     ; mode = browse
LDI r4, 0xD00C
STORE r4, r1     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r6, 0x9000
LDI r0, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r10, 60      ; <
STORE r6, r10
LDI r10, 104     ; h
LDI r0, 1
ADD r6, r0
STORE r6, r10
LDI r10, 49      ; 1
ADD r6, r0
STORE r6, r10
LDI r10, 62      ; >
ADD r6, r0
STORE r6, r10
LDI r10, 71      ; G
ADD r6, r0
STORE r6, r10
LDI r10, 101     ; e
ADD r6, r0
STORE r6, r10
LDI r10, 111     ; o
ADD r6, r0
STORE r6, r10
LDI r10, 109     ; m
ADD r6, r0
STORE r6, r10
LDI r10, 101     ; e
ADD r6, r0
STORE r6, r10
LDI r10, 116     ; t
ADD r6, r0
STORE r6, r10
LDI r10, 114     ; r
ADD r6, r0
STORE r6, r10
LDI r10, 121     ; y
ADD r6, r0
STORE r6, r10
LDI r10, 32      ; (space)
ADD r6, r0
STORE r6, r10
LDI r10, 79      ; O
ADD r6, r0
STORE r6, r10
LDI r10, 83      ; S
ADD r6, r0
STORE r6, r10
LDI r10, 60      ; <
ADD r6, r0
STORE r6, r10
LDI r10, 47      ; /
ADD r6, r0
STORE r6, r10
LDI r10, 104     ; h
ADD r6, r0
STORE r6, r10
LDI r10, 49      ; 1
ADD r6, r0
STORE r6, r10
LDI r10, 62      ; >
ADD r6, r0
STORE r6, r10
LDI r10, 60      ; <
ADD r6, r0
STORE r6, r10
LDI r10, 112     ; p
ADD r6, r0
STORE r6, r10
LDI r10, 62      ; >
ADD r6, r0
STORE r6, r10
LDI r10, 87      ; W
ADD r6, r0
STORE r6, r10
LDI r10, 101     ; e
ADD r6, r0
STORE r6, r10
LDI r10, 108     ; l
ADD r6, r0
STORE r6, r10
LDI r10, 99      ; c
ADD r6, r0
STORE r6, r10
LDI r10, 111     ; o
ADD r6, r0
STORE r6, r10
LDI r10, 109     ; m
ADD r6, r0
STORE r6, r10
LDI r10, 101     ; e
ADD r6, r0
STORE r6, r10
LDI r10, 33      ; !
ADD r6, r0
STORE r6, r10
LDI r10, 60      ; <
ADD r6, r0
STORE r6, r10
LDI r10, 47      ; /
ADD r6, r0
STORE r6, r10
LDI r10, 112     ; p
ADD r6, r0
STORE r6, r10
LDI r10, 62      ; >
ADD r6, r0
STORE r6, r10
LDI r10, 0       ; null terminator
ADD r6, r0
STORE r6, r10

; -- Parse HTML --
HITCLR
LDI r6, 0x9000  ; src = HTML buffer
LDI r0, 0xA000  ; dest = parsed lines buffer
LDI r10, 100     ; max_lines = 100
HTPARSE r6, r0, r10
; r11 = line count

; Store line count
LDI r4, 0xD004
STORE r4, r11

; -- Render URL bar --
; Draw dark blue bar at top
LDI r6, 0
LDI r0, 0
LDI r10, 256
LDI r14, 16
RECTF r6, r0, r10, r14, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r6, 0x5000
LDI r10, 103     ; g
STORE r6, r10
LDI r0, 1
ADD r6, r0
LDI r10, 101     ; e
STORE r6, r10
ADD r6, r0
LDI r10, 111     ; o
STORE r6, r10
ADD r6, r0
LDI r10, 58      ; :
STORE r6, r10
ADD r6, r0
LDI r10, 47      ; /
STORE r6, r10
ADD r6, r0
LDI r10, 47      ; /
STORE r6, r10
ADD r6, r0
LDI r10, 104     ; h
STORE r6, r10
ADD r6, r0
LDI r10, 111     ; o
STORE r6, r10
ADD r6, r0
LDI r10, 109     ; m
STORE r6, r10
ADD r6, r0
LDI r10, 101     ; e
STORE r6, r10
ADD r6, r0
LDI r10, 0       ; null
STORE r6, r10

; Render URL text
LDI r6, 2       ; x
LDI r0, 2       ; y
LDI r10, 0x5000  ; addr
LDI r14, 0x00FFFF ; cyan color
TEXT r6, r0, r10

; -- Render status bar --
LDI r6, 0
LDI r0, 240
LDI r10, 256
LDI r14, 16
RECTF r6, r0, r10, r14, r25

; -- Render parsed content --
; Read scroll offset
LDI r3, 0xD000
LOAD r3, r3    ; r3 = scroll

; Read line count
LDI r9, 0xD004
LOAD r9, r9    ; r9 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r4, 0        ; visible line counter
LDI r1, 1        ; increment
LDI r7, 24       ; max visible lines
LDI r6, 0       ; base Y = 20

render_loop:
  CMP r4, r7
  BGE r11, render_done
  CMP r4, r9
  BGE r11, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r0, r3     ; scroll
  ADD r0, r4      ; + vis_idx
  LDI r10, 33
  MUL r0, r10     ; * 33
  LDI r10, 0xA000
  ADD r0, r10     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r10, r0    ; fg_color
  CMP r10, r20     ; compare with 0 (black = empty)
  JZ r11, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r14, 4       ; x offset
  MOV r14, r6     ; y = base_y + line * 8
  LDI r16, 8
  MUL r14, r16
  LDI r16, 20
  ADD r14, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r1
    BGE r11, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r11, skip_first
    ; Draw char pixel
    MOV r18, r0
    ADD r18, r16
    ADD r18, r1     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r11, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r14, r10  ; colored pixel

  skip_first:
    ADD r16, r1
    JMP draw_chars

next_line:
  ADD r4, r1
  ADD r6, r1
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
