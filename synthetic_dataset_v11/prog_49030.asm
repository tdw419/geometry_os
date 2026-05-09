; DESCRIPTION: Draws a purple rectangle at (17, 26) with width 55 and height 50.
; PLAN: r0=17(x), r1=26(y), r2=55(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 26
LDI r2, 55
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
