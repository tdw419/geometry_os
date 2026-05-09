; DESCRIPTION: Draws a magenta rectangle at (9, 114) with width 77 and height 92.
; PLAN: r0=9(x), r1=114(y), r2=77(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 114
LDI r2, 77
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
