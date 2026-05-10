; DESCRIPTION: Draws a white rectangle at (83, 158) with width 102 and height 67.
; PLAN: r0=83(x), r1=158(y), r2=102(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 158
LDI r2, 102
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
