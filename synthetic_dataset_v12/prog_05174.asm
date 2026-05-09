; DESCRIPTION: Draws a red rectangle at (104, 8) with width 51 and height 101.
; PLAN: r0=104(x), r1=8(y), r2=51(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 8
LDI r2, 51
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
