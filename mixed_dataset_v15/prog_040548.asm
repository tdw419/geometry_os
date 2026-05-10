; DESCRIPTION: Draws a yellow rectangle at (26, 125) with width 112 and height 35.
; PLAN: r0=26(x), r1=125(y), r2=112(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 125
LDI r2, 112
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
