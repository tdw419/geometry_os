; DESCRIPTION: Places a magenta 30x43 box at position (144, 128).
; PLAN: r0=144(x), r1=128(y), r2=30(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 128
LDI r2, 30
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
