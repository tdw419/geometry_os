; DESCRIPTION: Draws a white rectangle at (33, 60) with width 100 and height 69.
; PLAN: r0=33(x), r1=60(y), r2=100(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 60
LDI r2, 100
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
