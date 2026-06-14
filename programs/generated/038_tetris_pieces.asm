; 038_tetris_pieces.asm -- Seven classic Tetris pieces on dark background
; Each piece made of 4 small squares (8x8 each) in its signature color
; Pieces arranged in two rows inside a bordered area

; Dark background
LDI r0, 0x111122
FILL r0

; Title bar at top
LDI r0, 0x222244
LDI r1, 0
LDI r2, 0
LDI r3, 256
LDI r4, 32
RECTF r1, r2, r3, r4, r0

; Border around pieces area
LDI r0, 0x444466
LDI r1, 8
LDI r2, 44
LDI r3, 240
LDI r4, 180
RECTF r1, r2, r3, r4, r0

; Inner dark area
LDI r0, 0x111122
LDI r1, 10
LDI r2, 46
LDI r3, 236
LDI r4, 176
RECTF r1, r2, r3, r4, r0

; Block size
LDI r3, 8
LDI r4, 8

; I-piece (cyan) horizontal bar at x=16, y=56
LDI r0, 0x00FFFF
LDI r1, 16
LDI r2, 56
RECTF r1, r2, r3, r4, r0
LDI r1, 24
RECTF r1, r2, r3, r4, r0
LDI r1, 32
RECTF r1, r2, r3, r4, r0
LDI r1, 40
RECTF r1, r2, r3, r4, r0

; O-piece (yellow) 2x2 square at x=72, y=56
LDI r0, 0xFFFF00
LDI r1, 72
LDI r2, 56
RECTF r1, r2, r3, r4, r0
LDI r1, 80
RECTF r1, r2, r3, r4, r0
LDI r2, 64
LDI r1, 72
RECTF r1, r2, r3, r4, r0
LDI r1, 80
RECTF r1, r2, r3, r4, r0

; T-piece (purple) at x=112, y=56
LDI r0, 0xAA00FF
LDI r2, 56
LDI r1, 112
RECTF r1, r2, r3, r4, r0
LDI r1, 120
RECTF r1, r2, r3, r4, r0
LDI r1, 128
RECTF r1, r2, r3, r4, r0
LDI r2, 64
LDI r1, 120
RECTF r1, r2, r3, r4, r0

; S-piece (green) at x=160, y=56
LDI r0, 0x00FF00
LDI r2, 56
LDI r1, 168
RECTF r1, r2, r3, r4, r0
LDI r1, 176
RECTF r1, r2, r3, r4, r0
LDI r2, 64
LDI r1, 160
RECTF r1, r2, r3, r4, r0
LDI r1, 168
RECTF r1, r2, r3, r4, r0

; Z-piece (red) at x=200, y=56
LDI r0, 0xFF0000
LDI r2, 56
LDI r1, 200
RECTF r1, r2, r3, r4, r0
LDI r1, 208
RECTF r1, r2, r3, r4, r0
LDI r2, 64
LDI r1, 208
RECTF r1, r2, r3, r4, r0
LDI r1, 216
RECTF r1, r2, r3, r4, r0

; Second row: J, L pieces and a well preview

; J-piece (blue) at x=24, y=96
LDI r0, 0x0000FF
LDI r2, 96
LDI r1, 32
RECTF r1, r2, r3, r4, r0
LDI r2, 104
LDI r1, 24
RECTF r1, r2, r3, r4, r0
LDI r1, 32
RECTF r1, r2, r3, r4, r0
LDI r2, 112
LDI r1, 32
RECTF r1, r2, r3, r4, r0

; L-piece (orange) at x=64, y=96
LDI r0, 0xFF8800
LDI r2, 96
LDI r1, 64
RECTF r1, r2, r3, r4, r0
LDI r2, 104
LDI r1, 64
RECTF r1, r2, r3, r4, r0
LDI r2, 112
LDI r1, 64
RECTF r1, r2, r3, r4, r0
LDI r1, 72
RECTF r1, r2, r3, r4, r0

; Mini game board preview: 10-wide grid lines at x=128..208, y=80..216
LDI r0, 0x222233
LDI r1, 128
LDI r2, 80
LDI r3, 80
LDI r4, 136
RECTF r1, r2, r3, r4, r0

; Grid lines vertical
LDI r0, 0x333355
LDI r3, 1
LDI r4, 136
LDI r2, 80
LDI r1, 136
RECTF r1, r2, r3, r4, r0
LDI r1, 144
RECTF r1, r2, r3, r4, r0
LDI r1, 152
RECTF r1, r2, r3, r4, r0
LDI r1, 160
RECTF r1, r2, r3, r4, r0
LDI r1, 168
RECTF r1, r2, r3, r4, r0
LDI r1, 176
RECTF r1, r2, r3, r4, r0
LDI r1, 184
RECTF r1, r2, r3, r4, r0
LDI r1, 192
RECTF r1, r2, r3, r4, r0
LDI r1, 200
RECTF r1, r2, r3, r4, r0

; Grid lines horizontal
LDI r3, 80
LDI r4, 1
LDI r1, 128
LDI r2, 88
RECTF r1, r2, r3, r4, r0
LDI r2, 96
RECTF r1, r2, r3, r4, r0
LDI r2, 104
RECTF r1, r2, r3, r4, r0
LDI r2, 112
RECTF r1, r2, r3, r4, r0
LDI r2, 120
RECTF r1, r2, r3, r4, r0
LDI r2, 128
RECTF r1, r2, r3, r4, r0
LDI r2, 136
RECTF r1, r2, r3, r4, r0
LDI r2, 144
RECTF r1, r2, r3, r4, r0
LDI r2, 152
RECTF r1, r2, r3, r4, r0
LDI r2, 160
RECTF r1, r2, r3, r4, r0
LDI r2, 168
RECTF r1, r2, r3, r4, r0
LDI r2, 176
RECTF r1, r2, r3, r4, r0
LDI r2, 184
RECTF r1, r2, r3, r4, r0
LDI r2, 192
RECTF r1, r2, r3, r4, r0
LDI r2, 200
RECTF r1, r2, r3, r4, r0

; Place some settled blocks in the game board (stacked at bottom)
; Row of blocks at bottom (y=200..208)
LDI r3, 8
LDI r4, 8
LDI r0, 0x00FFFF  ; cyan
LDI r1, 128
LDI r2, 200
RECTF r1, r2, r3, r4, r0
LDI r1, 144
RECTF r1, r2, r3, r4, r0
LDI r0, 0xFFFF00  ; yellow
LDI r1, 160
RECTF r1, r2, r3, r4, r0
LDI r1, 192
RECTF r1, r2, r3, r4, r0
LDI r0, 0xFF0000  ; red
LDI r1, 176
RECTF r1, r2, r3, r4, r0
LDI r0, 0xAA00FF  ; purple
LDI r1, 200
RECTF r1, r2, r3, r4, r0

; Second row from bottom (y=192..200)
LDI r0, 0x00FF00  ; green
LDI r1, 136
LDI r2, 192
RECTF r1, r2, r3, r4, r0
LDI r1, 160
RECTF r1, r2, r3, r4, r0
LDI r1, 176
RECTF r1, r2, r3, r4, r0
LDI r1, 200
RECTF r1, r2, r3, r4, r0

; Third row (y=184..192)
LDI r0, 0x0000FF  ; blue
LDI r1, 144
LDI r2, 184
RECTF r1, r2, r3, r4, r0
LDI r1, 168
RECTF r1, r2, r3, r4, r0
LDI r0, 0xFF8800  ; orange
LDI r1, 192
RECTF r1, r2, r3, r4, r0

; Falling piece preview (cyan I-piece vertical)
LDI r0, 0x00FFFF
LDI r1, 152
LDI r2, 88
RECTF r1, r2, r3, r4, r0
LDI r2, 96
RECTF r1, r2, r3, r4, r0
LDI r2, 104
RECTF r1, r2, r3, r4, r0
LDI r2, 112
RECTF r1, r2, r3, r4, r0

HALT
