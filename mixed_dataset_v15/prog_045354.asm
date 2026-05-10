; DESCRIPTION: Draws a red rectangle at (115, 51) with width 61 and height 66.
; PLAN: r0=115(x), r1=51(y), r2=61(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 51
LDI r2, 61
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
