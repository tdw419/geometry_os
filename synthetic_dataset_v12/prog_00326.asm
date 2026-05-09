; DESCRIPTION: Draws a green rectangle at (150, 112) with width 104 and height 69.
; PLAN: r0=150(x), r1=112(y), r2=104(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 112
LDI r2, 104
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
