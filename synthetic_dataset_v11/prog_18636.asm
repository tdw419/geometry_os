; DESCRIPTION: Draws a white rectangle at (85, 13) with width 115 and height 62.
; PLAN: r0=85(x), r1=13(y), r2=115(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 13
LDI r2, 115
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
