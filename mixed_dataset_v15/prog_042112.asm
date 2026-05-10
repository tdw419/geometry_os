; DESCRIPTION: Draws a white rectangle at (292, 3) with width 119 and height 30.
; PLAN: r0=292(x), r1=3(y), r2=119(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 3
LDI r2, 119
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
