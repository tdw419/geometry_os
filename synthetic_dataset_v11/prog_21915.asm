; DESCRIPTION: Draws a red rectangle at (136, 51) with width 104 and height 23.
; PLAN: r0=136(x), r1=51(y), r2=104(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 51
LDI r2, 104
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
