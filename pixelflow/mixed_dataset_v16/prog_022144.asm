; DESCRIPTION: Draws a white rectangle at (101, 162) with width 104 and height 77.
; PLAN: r0=101(x), r1=162(y), r2=104(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 162
LDI r2, 104
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
