; DESCRIPTION: Draws a white rectangle at (318, 183) with width 25 and height 18.
; PLAN: r0=318(x), r1=183(y), r2=25(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 183
LDI r2, 25
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
