; DESCRIPTION: Draws a white rectangle at (40, 80) with width 65 and height 119.
; PLAN: r0=40(x), r1=80(y), r2=65(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 80
LDI r2, 65
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
