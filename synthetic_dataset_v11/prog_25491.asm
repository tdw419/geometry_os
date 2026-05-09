; DESCRIPTION: Draws a magenta rectangle at (7, 6) with width 48 and height 66.
; PLAN: r0=7(x), r1=6(y), r2=48(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 6
LDI r2, 48
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
