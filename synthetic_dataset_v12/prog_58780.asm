; DESCRIPTION: Draws a red rectangle at (234, 176) with width 89 and height 75.
; PLAN: r0=234(x), r1=176(y), r2=89(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 176
LDI r2, 89
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
