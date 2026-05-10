; DESCRIPTION: Draws a magenta rectangle at (18, 23) with width 23 and height 69.
; PLAN: r0=18(x), r1=23(y), r2=23(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 23
LDI r2, 23
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
