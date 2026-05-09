; DESCRIPTION: Draws a white rectangle at (151, 115) with width 22 and height 115.
; PLAN: r0=151(x), r1=115(y), r2=22(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 115
LDI r2, 22
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
