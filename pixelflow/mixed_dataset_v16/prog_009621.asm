; DESCRIPTION: Draws a red rectangle at (178, 119) with width 95 and height 106.
; PLAN: r0=178(x), r1=119(y), r2=95(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 119
LDI r2, 95
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
