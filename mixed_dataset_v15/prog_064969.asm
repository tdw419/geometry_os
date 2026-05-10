; DESCRIPTION: Places a magenta 15x78 box at position (253, 3).
; PLAN: r0=253(x), r1=3(y), r2=15(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 3
LDI r2, 15
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
