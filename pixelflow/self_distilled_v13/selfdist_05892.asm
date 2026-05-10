; DESCRIPTION: Draws a red rectangle at (51, 40) with width 12 and height 89.
; PLAN: r0=51(x), r1=40(y), r2=12(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 40
LDI r2, 12
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
