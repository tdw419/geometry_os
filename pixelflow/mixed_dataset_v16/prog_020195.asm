; DESCRIPTION: Draws a magenta rectangle at (81, 225) with width 69 and height 14.
; PLAN: r0=81(x), r1=225(y), r2=69(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 225
LDI r2, 69
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
