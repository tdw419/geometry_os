; DESCRIPTION: Renders a blue box of size 118x24 starting at (325, 118).
; PLAN: r0=325(x), r1=118(y), r2=118(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 118
LDI r2, 118
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
