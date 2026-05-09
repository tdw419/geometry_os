; DESCRIPTION: Draws a white rectangle at (78, 70) with width 69 and height 104.
; PLAN: r0=78(x), r1=70(y), r2=69(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 70
LDI r2, 69
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
