; DESCRIPTION: Draws a white rectangle at (38, 104) with width 89 and height 63.
; PLAN: r0=38(x), r1=104(y), r2=89(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 104
LDI r2, 89
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
