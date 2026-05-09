; DESCRIPTION: Draws a white rectangle at (104, 1) with width 91 and height 116.
; PLAN: r0=104(x), r1=1(y), r2=91(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 1
LDI r2, 91
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
