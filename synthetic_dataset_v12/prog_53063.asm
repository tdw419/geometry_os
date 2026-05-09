; DESCRIPTION: Draws a red rectangle at (270, 100) with width 106 and height 65.
; PLAN: r0=270(x), r1=100(y), r2=106(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 100
LDI r2, 106
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
