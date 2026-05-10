; DESCRIPTION: Draws a red rectangle at (222, 156) with width 63 and height 96.
; PLAN: r0=222(x), r1=156(y), r2=63(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 156
LDI r2, 63
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
