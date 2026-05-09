; DESCRIPTION: Renders a blue box of size 88x69 starting at (347, 157).
; PLAN: r0=347(x), r1=157(y), r2=88(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 157
LDI r2, 88
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
