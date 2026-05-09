; DESCRIPTION: Draws a blue rectangle at (438, 43) with width 55 and height 105.
; PLAN: r0=438(x), r1=43(y), r2=55(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 43
LDI r2, 55
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
