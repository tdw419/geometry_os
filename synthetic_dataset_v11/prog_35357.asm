; DESCRIPTION: Draws a white rectangle at (112, 84) with width 83 and height 84.
; PLAN: r0=112(x), r1=84(y), r2=83(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 84
LDI r2, 83
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
