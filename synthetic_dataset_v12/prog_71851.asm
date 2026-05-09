; DESCRIPTION: Draws a white rectangle at (223, 118) with width 98 and height 17.
; PLAN: r0=223(x), r1=118(y), r2=98(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 118
LDI r2, 98
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
