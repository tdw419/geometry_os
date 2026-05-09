; DESCRIPTION: Draws a red rectangle at (311, 3) with width 22 and height 38.
; PLAN: r0=311(x), r1=3(y), r2=22(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 3
LDI r2, 22
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
