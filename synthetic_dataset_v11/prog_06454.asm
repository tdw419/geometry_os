; DESCRIPTION: Draws a white rectangle at (100, 99) with width 12 and height 115.
; PLAN: r0=100(x), r1=99(y), r2=12(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 99
LDI r2, 12
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
