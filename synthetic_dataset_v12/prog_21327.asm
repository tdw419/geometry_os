; DESCRIPTION: Draws a white rectangle at (321, 125) with width 89 and height 86.
; PLAN: r0=321(x), r1=125(y), r2=89(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 125
LDI r2, 89
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
