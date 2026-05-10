; DESCRIPTION: Draws a white rectangle at (320, 153) with width 104 and height 35.
; PLAN: r0=320(x), r1=153(y), r2=104(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 153
LDI r2, 104
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
