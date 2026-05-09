; DESCRIPTION: Draws a white rectangle at (475, 104) with width 28 and height 117.
; PLAN: r0=475(x), r1=104(y), r2=28(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 104
LDI r2, 28
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
