; DESCRIPTION: Places a magenta 115x94 rectangle at position (56, 78).
; PLAN: r0=56(x), r1=78(y), r2=115(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 78
LDI r2, 115
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
