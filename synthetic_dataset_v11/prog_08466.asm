; DESCRIPTION: Draws a magenta rectangle at (134, 166) with width 47 and height 54.
; PLAN: r0=134(x), r1=166(y), r2=47(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 166
LDI r2, 47
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
