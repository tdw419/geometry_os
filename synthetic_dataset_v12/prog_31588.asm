; DESCRIPTION: Draws a magenta rectangle at (114, 44) with width 55 and height 102.
; PLAN: r0=114(x), r1=44(y), r2=55(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 44
LDI r2, 55
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
