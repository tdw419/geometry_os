; DESCRIPTION: Draws a blue rectangle at (17, 226) with width 97 and height 21.
; PLAN: r0=17(x), r1=226(y), r2=97(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 226
LDI r2, 97
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
