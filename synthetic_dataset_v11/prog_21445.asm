; DESCRIPTION: Draws a white rectangle at (107, 175) with width 105 and height 81.
; PLAN: r0=107(x), r1=175(y), r2=105(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 175
LDI r2, 105
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
