; DESCRIPTION: Renders a blue box of size 80x17 starting at (4, 137).
; PLAN: r0=4(x), r1=137(y), r2=80(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 137
LDI r2, 80
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
