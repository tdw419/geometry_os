; DESCRIPTION: Draws a magenta rectangle at (406, 2) with width 25 and height 100.
; PLAN: r0=406(x), r1=2(y), r2=25(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 2
LDI r2, 25
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
