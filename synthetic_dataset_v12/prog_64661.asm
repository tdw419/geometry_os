; DESCRIPTION: Draws a white rectangle at (388, 104) with width 50 and height 99.
; PLAN: r0=388(x), r1=104(y), r2=50(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 104
LDI r2, 50
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
