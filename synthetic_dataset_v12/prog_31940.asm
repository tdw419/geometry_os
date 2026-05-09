; DESCRIPTION: Draws a white rectangle at (89, 62) with width 85 and height 45.
; PLAN: r0=89(x), r1=62(y), r2=85(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 62
LDI r2, 85
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
