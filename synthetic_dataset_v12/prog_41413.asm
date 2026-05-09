; DESCRIPTION: Draws a red rectangle at (55, 85) with width 95 and height 92.
; PLAN: r0=55(x), r1=85(y), r2=95(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 85
LDI r2, 95
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
