; DESCRIPTION: Draws a purple rectangle at (367, 17) with width 69 and height 86.
; PLAN: r0=367(x), r1=17(y), r2=69(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 17
LDI r2, 69
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
