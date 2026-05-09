; DESCRIPTION: Draws a white rectangle at (306, 145) with width 49 and height 95.
; PLAN: r0=306(x), r1=145(y), r2=49(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 145
LDI r2, 49
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
