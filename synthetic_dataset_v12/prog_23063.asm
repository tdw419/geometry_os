; DESCRIPTION: Draws a white rectangle at (104, 66) with width 12 and height 46.
; PLAN: r0=104(x), r1=66(y), r2=12(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 66
LDI r2, 12
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
