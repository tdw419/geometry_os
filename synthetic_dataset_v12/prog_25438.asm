; DESCRIPTION: Draws a red rectangle at (229, 51) with width 107 and height 38.
; PLAN: r0=229(x), r1=51(y), r2=107(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 51
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
