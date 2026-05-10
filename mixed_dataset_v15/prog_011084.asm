; DESCRIPTION: Draws a white rectangle at (165, 104) with width 54 and height 60.
; PLAN: r0=165(x), r1=104(y), r2=54(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 104
LDI r2, 54
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
