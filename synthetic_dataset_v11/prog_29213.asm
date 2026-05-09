; DESCRIPTION: Draws a white rectangle at (104, 35) with width 81 and height 92.
; PLAN: r0=104(x), r1=35(y), r2=81(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 35
LDI r2, 81
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
