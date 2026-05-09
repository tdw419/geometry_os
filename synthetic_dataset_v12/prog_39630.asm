; DESCRIPTION: Draws a red rectangle at (396, 110) with width 68 and height 36.
; PLAN: r0=396(x), r1=110(y), r2=68(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 110
LDI r2, 68
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
