; DESCRIPTION: Draws a red rectangle at (92, 89) with width 85 and height 102.
; PLAN: r0=92(x), r1=89(y), r2=85(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 89
LDI r2, 85
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
