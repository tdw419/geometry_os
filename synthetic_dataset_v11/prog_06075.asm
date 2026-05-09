; DESCRIPTION: Draws a white rectangle at (148, 84) with width 93 and height 110.
; PLAN: r0=148(x), r1=84(y), r2=93(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 84
LDI r2, 93
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
