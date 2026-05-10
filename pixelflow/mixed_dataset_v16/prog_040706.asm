; DESCRIPTION: Draws a green rectangle at (348, 82) with width 115 and height 66.
; PLAN: r0=348(x), r1=82(y), r2=115(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 82
LDI r2, 115
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
