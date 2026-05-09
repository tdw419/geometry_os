; DESCRIPTION: Draws a magenta rectangle at (366, 116) with width 37 and height 58.
; PLAN: r0=366(x), r1=116(y), r2=37(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 116
LDI r2, 37
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
