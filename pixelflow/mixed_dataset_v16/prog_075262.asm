; DESCRIPTION: Draws a white rectangle at (274, 87) with width 105 and height 67.
; PLAN: r0=274(x), r1=87(y), r2=105(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 87
LDI r2, 105
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
