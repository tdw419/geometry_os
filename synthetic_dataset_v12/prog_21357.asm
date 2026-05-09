; DESCRIPTION: Draws a white rectangle at (91, 75) with width 12 and height 104.
; PLAN: r0=91(x), r1=75(y), r2=12(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 75
LDI r2, 12
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
