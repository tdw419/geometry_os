; DESCRIPTION: Draws a white rectangle at (105, 69) with width 67 and height 12.
; PLAN: r0=105(x), r1=69(y), r2=67(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 69
LDI r2, 67
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
