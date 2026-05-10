; DESCRIPTION: Draws a white rectangle at (292, 110) with width 86 and height 37.
; PLAN: r0=292(x), r1=110(y), r2=86(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 110
LDI r2, 86
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
