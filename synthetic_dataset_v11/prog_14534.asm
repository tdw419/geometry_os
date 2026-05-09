; DESCRIPTION: Draws a white rectangle at (9, 138) with width 10 and height 85.
; PLAN: r0=9(x), r1=138(y), r2=10(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 138
LDI r2, 10
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
