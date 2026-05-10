; DESCRIPTION: Draws a green rectangle at (51, 137) with width 57 and height 72.
; PLAN: r0=51(x), r1=137(y), r2=57(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 137
LDI r2, 57
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
