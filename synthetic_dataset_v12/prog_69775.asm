; DESCRIPTION: Draws a black rectangle at (375, 125) with width 112 and height 54.
; PLAN: r0=375(x), r1=125(y), r2=112(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 125
LDI r2, 112
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
