; DESCRIPTION: Draws a green rectangle at (371, 141) with width 17 and height 15.
; PLAN: r0=371(x), r1=141(y), r2=17(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 141
LDI r2, 17
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
