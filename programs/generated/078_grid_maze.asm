; MAZE -- Grid maze with green walls and black corridors
; 4x4 cell grid with selective wall segments creating corridors

LDI r4, 0x00AA44

; Outer border
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 4
RECTF r0, r1, r2, r3, r4
LDI r1, 252
RECTF r0, r1, r2, r3, r4
LDI r1, 4
LDI r2, 4
LDI r3, 248
RECTF r0, r1, r2, r3, r4
LDI r0, 252
RECTF r0, r1, r2, r3, r4

; Horizontal wall y=64, col 1 (x=68..128)
LDI r0, 68
LDI r1, 64
LDI r2, 60
LDI r3, 4
RECTF r0, r1, r2, r3, r4
; Horizontal wall y=64, col 3 (x=196..252)
LDI r0, 196
LDI r2, 56
RECTF r0, r1, r2, r3, r4

; Horizontal wall y=128, col 0 (x=4..64)
LDI r0, 4
LDI r1, 128
LDI r2, 60
RECTF r0, r1, r2, r3, r4
; Horizontal wall y=128, col 2 (x=132..192)
LDI r0, 132
RECTF r0, r1, r2, r3, r4

; Horizontal wall y=192, col 1 (x=68..128)
LDI r0, 68
LDI r1, 192
RECTF r0, r1, r2, r3, r4
; Horizontal wall y=192, col 2 (x=132..192)
LDI r0, 132
RECTF r0, r1, r2, r3, r4

; Vertical wall x=64, row 0 (y=4..60)
LDI r0, 64
LDI r1, 4
LDI r2, 4
LDI r3, 56
RECTF r0, r1, r2, r3, r4
; Vertical wall x=64, row 2 (y=132..188)
LDI r1, 132
RECTF r0, r1, r2, r3, r4

; Vertical wall x=128, row 1 (y=68..124)
LDI r0, 128
LDI r1, 68
RECTF r0, r1, r2, r3, r4
; Vertical wall x=128, row 3 (y=196..252)
LDI r1, 196
RECTF r0, r1, r2, r3, r4

; Vertical wall x=192, row 0 (y=4..60)
LDI r0, 192
LDI r1, 4
RECTF r0, r1, r2, r3, r4
; Vertical wall x=192, row 3 (y=196..252)
LDI r1, 196
RECTF r0, r1, r2, r3, r4

HALT
