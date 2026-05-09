; DESCRIPTION: Draws a black rectangle at (65, 18) with width 53 and height 110.
; PLAN: r0=65(x), r1=18(y), r2=53(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 18
LDI r2, 53
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
