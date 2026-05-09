; DESCRIPTION: Draws a red rectangle at (91, 95) with width 15 and height 106.
; PLAN: r0=91(x), r1=95(y), r2=15(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 95
LDI r2, 15
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
