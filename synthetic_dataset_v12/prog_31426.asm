; DESCRIPTION: Draws a red rectangle at (318, 4) with width 102 and height 63.
; PLAN: r0=318(x), r1=4(y), r2=102(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 4
LDI r2, 102
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
