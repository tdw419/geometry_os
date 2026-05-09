; DESCRIPTION: Draws a blue rectangle at (229, 69) with width 17 and height 94.
; PLAN: r0=229(x), r1=69(y), r2=17(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 69
LDI r2, 17
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
