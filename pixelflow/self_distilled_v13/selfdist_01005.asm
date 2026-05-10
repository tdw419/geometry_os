; DESCRIPTION: Draws a white rectangle at (158, 83) with width 63 and height 75.
; PLAN: r0=158(x), r1=83(y), r2=63(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 83
LDI r2, 63
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
