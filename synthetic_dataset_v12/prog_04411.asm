; DESCRIPTION: Draws a white rectangle at (357, 172) with width 106 and height 57.
; PLAN: r0=357(x), r1=172(y), r2=106(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 172
LDI r2, 106
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
