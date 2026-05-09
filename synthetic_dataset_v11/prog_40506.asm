; DESCRIPTION: Draws a black rectangle at (69, 35) with width 97 and height 24.
; PLAN: r0=69(x), r1=35(y), r2=97(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 35
LDI r2, 97
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
