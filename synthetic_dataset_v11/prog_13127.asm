; DESCRIPTION: Draws a blue rectangle at (187, 104) with width 37 and height 112.
; PLAN: r0=187(x), r1=104(y), r2=37(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 104
LDI r2, 37
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
