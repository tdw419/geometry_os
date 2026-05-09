; DESCRIPTION: Draws a white rectangle at (37, 54) with width 85 and height 12.
; PLAN: r0=37(x), r1=54(y), r2=85(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 54
LDI r2, 85
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
