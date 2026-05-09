; DESCRIPTION: Renders a blue box of size 32x118 starting at (411, 47).
; PLAN: r0=411(x), r1=47(y), r2=32(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 47
LDI r2, 32
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
