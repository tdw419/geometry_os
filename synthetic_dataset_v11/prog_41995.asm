; DESCRIPTION: Draws a white rectangle at (37, 68) with width 31 and height 43.
; PLAN: r0=37(x), r1=68(y), r2=31(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 68
LDI r2, 31
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
