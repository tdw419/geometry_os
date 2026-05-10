; DESCRIPTION: Draws a white rectangle at (187, 110) with width 106 and height 67.
; PLAN: r0=187(x), r1=110(y), r2=106(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 110
LDI r2, 106
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
