; DESCRIPTION: Draws a red rectangle at (20, 137) with width 51 and height 87.
; PLAN: r0=20(x), r1=137(y), r2=51(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 137
LDI r2, 51
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
