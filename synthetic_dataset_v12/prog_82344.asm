; DESCRIPTION: Draws a white rectangle at (453, 84) with width 37 and height 60.
; PLAN: r0=453(x), r1=84(y), r2=37(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 84
LDI r2, 37
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
