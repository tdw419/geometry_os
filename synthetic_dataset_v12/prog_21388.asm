; DESCRIPTION: Renders a blue box of size 64x118 starting at (134, 54).
; PLAN: r0=134(x), r1=54(y), r2=64(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 54
LDI r2, 64
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
