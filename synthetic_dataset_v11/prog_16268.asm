; DESCRIPTION: Renders a blue box of size 115x118 starting at (48, 85).
; PLAN: r0=48(x), r1=85(y), r2=115(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 85
LDI r2, 115
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
