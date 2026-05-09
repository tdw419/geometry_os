; DESCRIPTION: Draws a red rectangle at (14, 78) with width 79 and height 95.
; PLAN: r0=14(x), r1=78(y), r2=79(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 78
LDI r2, 79
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
