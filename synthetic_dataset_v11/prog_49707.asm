; DESCRIPTION: Draws a red rectangle at (26, 51) with width 110 and height 64.
; PLAN: r0=26(x), r1=51(y), r2=110(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 51
LDI r2, 110
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
