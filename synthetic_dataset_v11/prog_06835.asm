; DESCRIPTION: Draws a magenta rectangle at (99, 60) with width 18 and height 95.
; PLAN: r0=99(x), r1=60(y), r2=18(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 60
LDI r2, 18
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
