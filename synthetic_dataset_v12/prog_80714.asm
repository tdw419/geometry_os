; DESCRIPTION: Draws a orange rectangle at (24, 113) with width 112 and height 17.
; PLAN: r0=24(x), r1=113(y), r2=112(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 113
LDI r2, 112
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
