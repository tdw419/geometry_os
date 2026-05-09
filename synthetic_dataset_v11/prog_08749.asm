; DESCRIPTION: Draws a magenta rectangle at (10, 127) with width 92 and height 59.
; PLAN: r0=10(x), r1=127(y), r2=92(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 127
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
