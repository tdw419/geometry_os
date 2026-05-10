; DESCRIPTION: Renders a blue box of size 115x94 starting at (155, 36).
; PLAN: r0=155(x), r1=36(y), r2=115(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 36
LDI r2, 115
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
