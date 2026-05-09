; DESCRIPTION: Renders a blue box of size 29x78 starting at (163, 96).
; PLAN: r0=163(x), r1=96(y), r2=29(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 96
LDI r2, 29
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
