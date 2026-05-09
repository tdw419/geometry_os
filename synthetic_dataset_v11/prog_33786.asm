; DESCRIPTION: Draws a yellow rectangle at (35, 91) with width 43 and height 12.
; PLAN: r0=35(x), r1=91(y), r2=43(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 91
LDI r2, 43
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
