; DESCRIPTION: Draws a red rectangle at (311, 109) with width 55 and height 53.
; PLAN: r0=311(x), r1=109(y), r2=55(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 109
LDI r2, 55
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
