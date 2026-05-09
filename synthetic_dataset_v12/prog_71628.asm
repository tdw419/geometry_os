; DESCRIPTION: Draws a white rectangle at (115, 6) with width 109 and height 78.
; PLAN: r0=115(x), r1=6(y), r2=109(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 6
LDI r2, 109
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
