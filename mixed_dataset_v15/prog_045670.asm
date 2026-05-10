; DESCRIPTION: Draws a white rectangle at (30, 83) with width 118 and height 101.
; PLAN: r0=30(x), r1=83(y), r2=118(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 83
LDI r2, 118
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
