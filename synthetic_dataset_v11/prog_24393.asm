; DESCRIPTION: Draws a white rectangle at (15, 69) with width 55 and height 118.
; PLAN: r0=15(x), r1=69(y), r2=55(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 69
LDI r2, 55
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
