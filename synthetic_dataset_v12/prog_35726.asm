; DESCRIPTION: Draws a green rectangle at (266, 143) with width 105 and height 58.
; PLAN: r0=266(x), r1=143(y), r2=105(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 143
LDI r2, 105
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
