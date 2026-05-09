; DESCRIPTION: Draws a white rectangle at (427, 183) with width 14 and height 70.
; PLAN: r0=427(x), r1=183(y), r2=14(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 183
LDI r2, 14
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
