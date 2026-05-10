; DESCRIPTION: Renders a blue rectangular region spanning 15 by 88 at (86, 159).
; PLAN: r0=86(x), r1=159(y), r2=15(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 159
LDI r2, 15
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
