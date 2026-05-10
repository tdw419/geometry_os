; DESCRIPTION: Draws a red rectangle at (145, 25) with width 63 and height 62.
; PLAN: r0=145(x), r1=25(y), r2=63(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 25
LDI r2, 63
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
