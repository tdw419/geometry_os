; DESCRIPTION: Draws a white rectangle at (49, 75) with width 77 and height 95.
; PLAN: r0=49(x), r1=75(y), r2=77(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 75
LDI r2, 77
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
