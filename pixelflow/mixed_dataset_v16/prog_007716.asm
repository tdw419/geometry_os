; DESCRIPTION: Draws a blue rectangle at (251, 62) with width 104 and height 56.
; PLAN: r0=251(x), r1=62(y), r2=104(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 62
LDI r2, 104
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
