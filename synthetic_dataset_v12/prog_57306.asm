; DESCRIPTION: Draws a white rectangle at (155, 5) with width 120 and height 23.
; PLAN: r0=155(x), r1=5(y), r2=120(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 5
LDI r2, 120
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
