; DESCRIPTION: Places a magenta 78x118 box at position (351, 54).
; PLAN: r0=351(x), r1=54(y), r2=78(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 54
LDI r2, 78
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
