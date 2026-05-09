; DESCRIPTION: Draws a white rectangle at (153, 19) with width 81 and height 104.
; PLAN: r0=153(x), r1=19(y), r2=81(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 19
LDI r2, 81
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
