; DESCRIPTION: Draws a magenta rectangle at (130, 121) with width 114 and height 98.
; PLAN: r0=130(x), r1=121(y), r2=114(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 121
LDI r2, 114
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
