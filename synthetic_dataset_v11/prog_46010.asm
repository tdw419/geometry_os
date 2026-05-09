; DESCRIPTION: Draws a red rectangle at (93, 55) with width 15 and height 115.
; PLAN: r0=93(x), r1=55(y), r2=15(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 55
LDI r2, 15
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
