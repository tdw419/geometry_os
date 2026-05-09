; DESCRIPTION: Draws a red rectangle at (121, 89) with width 30 and height 92.
; PLAN: r0=121(x), r1=89(y), r2=30(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 89
LDI r2, 30
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
