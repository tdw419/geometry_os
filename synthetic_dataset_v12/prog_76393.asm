; DESCRIPTION: Renders a blue box of size 101x88 starting at (240, 17).
; PLAN: r0=240(x), r1=17(y), r2=101(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 101
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
