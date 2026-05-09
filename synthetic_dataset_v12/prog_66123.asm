; DESCRIPTION: Draws a blue rectangle at (237, 40) with width 13 and height 88.
; PLAN: r0=237(x), r1=40(y), r2=13(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 40
LDI r2, 13
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
