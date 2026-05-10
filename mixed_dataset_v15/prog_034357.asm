; DESCRIPTION: Draws a white rectangle at (359, 116) with width 69 and height 30.
; PLAN: r0=359(x), r1=116(y), r2=69(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 116
LDI r2, 69
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
