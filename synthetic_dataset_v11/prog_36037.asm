; DESCRIPTION: Draws a white rectangle at (63, 44) with width 104 and height 19.
; PLAN: r0=63(x), r1=44(y), r2=104(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 44
LDI r2, 104
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
