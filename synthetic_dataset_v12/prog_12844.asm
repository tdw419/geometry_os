; DESCRIPTION: Draws a white rectangle at (133, 140) with width 101 and height 104.
; PLAN: r0=133(x), r1=140(y), r2=101(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 140
LDI r2, 101
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
