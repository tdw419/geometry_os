; DESCRIPTION: Draws a white rectangle at (280, 84) with width 98 and height 119.
; PLAN: r0=280(x), r1=84(y), r2=98(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 84
LDI r2, 98
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
