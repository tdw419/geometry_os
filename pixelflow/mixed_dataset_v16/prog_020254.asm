; DESCRIPTION: Draws a red rectangle at (0, 161) with width 51 and height 18.
; PLAN: r0=0(x), r1=161(y), r2=51(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 161
LDI r2, 51
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
