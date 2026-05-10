; DESCRIPTION: Draws a white rectangle at (1, 5) with width 104 and height 55.
; PLAN: r0=1(x), r1=5(y), r2=104(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 5
LDI r2, 104
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
