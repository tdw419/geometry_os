; DESCRIPTION: Draws a white rectangle at (268, 68) with width 118 and height 119.
; PLAN: r0=268(x), r1=68(y), r2=118(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 68
LDI r2, 118
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
