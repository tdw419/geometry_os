; DESCRIPTION: Draws a magenta rectangle at (181, 34) with width 76 and height 99.
; PLAN: r0=181(x), r1=34(y), r2=76(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 34
LDI r2, 76
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
