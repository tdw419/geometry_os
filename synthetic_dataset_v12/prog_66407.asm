; DESCRIPTION: Draws a white rectangle at (81, 165) with width 18 and height 26.
; PLAN: r0=81(x), r1=165(y), r2=18(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 165
LDI r2, 18
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
