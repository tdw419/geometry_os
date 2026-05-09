; DESCRIPTION: Draws a green rectangle at (51, 104) with width 111 and height 53.
; PLAN: r0=51(x), r1=104(y), r2=111(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 104
LDI r2, 111
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
