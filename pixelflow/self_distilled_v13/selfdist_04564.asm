; DESCRIPTION: Draws a white rectangle at (63, 142) with width 25 and height 110.
; PLAN: r0=63(x), r1=142(y), r2=25(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 142
LDI r2, 25
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
