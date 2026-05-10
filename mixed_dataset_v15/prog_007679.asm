; DESCRIPTION: Draws a white rectangle at (155, 75) with width 103 and height 95.
; PLAN: r0=155(x), r1=75(y), r2=103(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 75
LDI r2, 103
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
