; DESCRIPTION: Draws a white rectangle at (155, 118) with width 63 and height 61.
; PLAN: r0=155(x), r1=118(y), r2=63(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 118
LDI r2, 63
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
