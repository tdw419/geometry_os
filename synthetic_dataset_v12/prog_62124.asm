; DESCRIPTION: Draws a blue rectangle at (438, 15) with width 14 and height 76.
; PLAN: r0=438(x), r1=15(y), r2=14(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 15
LDI r2, 14
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
