; DESCRIPTION: Draws a white rectangle at (68, 147) with width 104 and height 25.
; PLAN: r0=68(x), r1=147(y), r2=104(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 147
LDI r2, 104
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
