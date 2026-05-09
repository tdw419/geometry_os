; DESCRIPTION: Draws a blue rectangle at (470, 20) with width 12 and height 88.
; PLAN: r0=470(x), r1=20(y), r2=12(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 20
LDI r2, 12
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
