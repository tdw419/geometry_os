; DESCRIPTION: Places a magenta 78x74 rectangle at position (147, 110).
; PLAN: r0=147(x), r1=110(y), r2=78(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 110
LDI r2, 78
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
