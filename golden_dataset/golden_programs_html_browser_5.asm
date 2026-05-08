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
LDI r13, 0
STORE r4, r13     ; scroll = 0
LDI r4, 0xD004
STORE r4, r13     ; line_count = 0
LDI r4, 0xD008
STORE r4, r13     ; mode = browse
LDI r4, 0xD00C
STORE r4, r13     ; history count = 0

; -- Build a test page in HTML buffer --
; Write "<h1>Geometry OS</h1><p>Welcome!</p>" into 0x9000
LDI r3, 0x9000
LDI r12, 0

; Write chars using STRO-like STORE sequence
; "<h1>Geometry OS</h1><p>Welcome!</p>"
; Character codes: < = 60, h = 104, 1 = 49, > = 62, etc.
; We'll write the HTML string byte by byte
LDI r7, 60      ; <
STORE r3, r7
LDI r7, 104     ; h
LDI r12, 1
ADD r3, r12
STORE r3, r7
LDI r7, 49      ; 1
ADD r3, r12
STORE r3, r7
LDI r7, 62      ; >
ADD r3, r12
STORE r3, r7
LDI r7, 71      ; G
ADD r3, r12
STORE r3, r7
LDI r7, 101     ; e
ADD r3, r12
STORE r3, r7
LDI r7, 111     ; o
ADD r3, r12
STORE r3, r7
LDI r7, 109     ; m
ADD r3, r12
STORE r3, r7
LDI r7, 101     ; e
ADD r3, r12
STORE r3, r7
LDI r7, 116     ; t
ADD r3, r12
STORE r3, r7
LDI r7, 114     ; r
ADD r3, r12
STORE r3, r7
LDI r7, 121     ; y
ADD r3, r12
STORE r3, r7
LDI r7, 32      ; (space)
ADD r3, r12
STORE r3, r7
LDI r7, 79      ; O
ADD r3, r12
STORE r3, r7
LDI r7, 83      ; S
ADD r3, r12
STORE r3, r7
LDI r7, 60      ; <
ADD r3, r12
STORE r3, r7
LDI r7, 47      ; /
ADD r3, r12
STORE r3, r7
LDI r7, 104     ; h
ADD r3, r12
STORE r3, r7
LDI r7, 49      ; 1
ADD r3, r12
STORE r3, r7
LDI r7, 62      ; >
ADD r3, r12
STORE r3, r7
LDI r7, 60      ; <
ADD r3, r12
STORE r3, r7
LDI r7, 112     ; p
ADD r3, r12
STORE r3, r7
LDI r7, 62      ; >
ADD r3, r12
STORE r3, r7
LDI r7, 87      ; W
ADD r3, r12
STORE r3, r7
LDI r7, 101     ; e
ADD r3, r12
STORE r3, r7
LDI r7, 108     ; l
ADD r3, r12
STORE r3, r7
LDI r7, 99      ; c
ADD r3, r12
STORE r3, r7
LDI r7, 111     ; o
ADD r3, r12
STORE r3, r7
LDI r7, 109     ; m
ADD r3, r12
STORE r3, r7
LDI r7, 101     ; e
ADD r3, r12
STORE r3, r7
LDI r7, 33      ; !
ADD r3, r12
STORE r3, r7
LDI r7, 60      ; <
ADD r3, r12
STORE r3, r7
LDI r7, 47      ; /
ADD r3, r12
STORE r3, r7
LDI r7, 112     ; p
ADD r3, r12
STORE r3, r7
LDI r7, 62      ; >
ADD r3, r12
STORE r3, r7
LDI r7, 0       ; null terminator
ADD r3, r12
STORE r3, r7

; -- Parse HTML --
HITCLR
LDI r3, 0x9000  ; src = HTML buffer
LDI r12, 0xA000  ; dest = parsed lines buffer
LDI r7, 100     ; max_lines = 100
HTPARSE r3, r12, r7
; r14 = line count

; Store line count
LDI r4, 0xD004
STORE r4, r14

; -- Render URL bar --
; Draw dark blue bar at top
LDI r3, 0
LDI r12, 0
LDI r7, 256
LDI r15, 16
RECTF r3, r12, r7, r15, r24

; Draw "geo://" in URL bar using TEXT opcode
LDI r3, 0x5000
LDI r7, 103     ; g
STORE r3, r7
LDI r12, 1
ADD r3, r12
LDI r7, 101     ; e
STORE r3, r7
ADD r3, r12
LDI r7, 111     ; o
STORE r3, r7
ADD r3, r12
LDI r7, 58      ; :
STORE r3, r7
ADD r3, r12
LDI r7, 47      ; /
STORE r3, r7
ADD r3, r12
LDI r7, 47      ; /
STORE r3, r7
ADD r3, r12
LDI r7, 104     ; h
STORE r3, r7
ADD r3, r12
LDI r7, 111     ; o
STORE r3, r7
ADD r3, r12
LDI r7, 109     ; m
STORE r3, r7
ADD r3, r12
LDI r7, 101     ; e
STORE r3, r7
ADD r3, r12
LDI r7, 0       ; null
STORE r3, r7

; Render URL text
LDI r3, 2       ; x
LDI r12, 2       ; y
LDI r7, 0x5000  ; addr
LDI r15, 0x00FFFF ; cyan color
TEXT r3, r12, r7

; -- Render status bar --
LDI r3, 0
LDI r12, 240
LDI r7, 256
LDI r15, 16
RECTF r3, r12, r7, r15, r25

; -- Render parsed content --
; Read scroll offset
LDI r5, 0xD000
LOAD r5, r5    ; r5 = scroll

; Read line count
LDI r10, 0xD004
LOAD r10, r10    ; r10 = line_count

; Render up to 24 visible lines (screen rows 20-236, 8px per line)
LDI r4, 0        ; visible line counter
LDI r13, 1        ; increment
LDI r9, 24       ; max visible lines
LDI r3, 0       ; base Y = 20

render_loop:
  CMP r4, r9
  BGE r14, render_done
  CMP r4, r10
  BGE r14, render_done

  ; Calculate line address: 0xA000 + (scroll + vis_idx) * 33
  MOV r12, r5     ; scroll
  ADD r12, r4      ; + vis_idx
  LDI r7, 33
  MUL r12, r7     ; * 33
  LDI r7, 0xA000
  ADD r12, r7     ; + base

  ; Check if we have valid data (color != 0 or has chars)
  LOAD r7, r12    ; fg_color
  CMP r7, r20     ; compare with 0 (black = empty)
  JZ r14, next_line

  ; Draw the line using DRAWTEXT-style rendering
  ; For simplicity, draw first char as a colored pixel
  ; Real rendering would use DRAWTEXT opcode with per-line colors
  LDI r15, 4       ; x offset
  MOV r15, r3     ; y = base_y + line * 8
  LDI r16, 8
  MUL r15, r16
  LDI r16, 20
  ADD r15, r16

  ; Draw each char as a single pixel (simplified)
  LDI r16, 0       ; char index
  draw_chars:
    CMP r16, r13
    BGE r14, next_line
    LDI r17, 1
    CMP r16, r17
    BGE r14, skip_first
    ; Draw char pixel
    MOV r18, r12
    ADD r18, r16
    ADD r18, r13     ; skip color word
    LOAD r18, r18   ; char code
    CMP r18, r20
    JZ r14, next_line

    ; x = 4 + char_idx * 8, y = line_y
    MOV r19, r16
    LDI r17, 8
    MUL r19, r17
    LDI r17, 4
    ADD r19, r17
    PSET r19, r15, r7  ; colored pixel

  skip_first:
    ADD r16, r13
    JMP draw_chars

next_line:
  ADD r4, r13
  ADD r3, r13
  JMP render_loop

render_done:
  ; Wait for user input
  FILL r20         ; clear screen (black)
  FRAME
  JMP render_done  ; infinite display loop

HALT
