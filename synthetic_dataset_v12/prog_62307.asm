; DESCRIPTION: Draws a magenta rectangle at (312, 48) with width 44 and height 92.
; PLAN: r0=312(x), r1=48(y), r2=44(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 48
LDI r2, 44
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
