; DESCRIPTION: Draws a white rectangle at (319, 137) with width 105 and height 98.
; PLAN: r0=319(x), r1=137(y), r2=105(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 137
LDI r2, 105
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
