; DESCRIPTION: Draws a red rectangle at (88, 145) with width 65 and height 58.
; PLAN: r0=88(x), r1=145(y), r2=65(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 145
LDI r2, 65
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
