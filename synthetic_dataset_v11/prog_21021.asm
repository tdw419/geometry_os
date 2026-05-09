; DESCRIPTION: Draws a white rectangle at (104, 157) with width 72 and height 96.
; PLAN: r0=104(x), r1=157(y), r2=72(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 157
LDI r2, 72
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
