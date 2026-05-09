; DESCRIPTION: Draws a magenta rectangle at (69, 95) with width 58 and height 98.
; PLAN: r0=69(x), r1=95(y), r2=58(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 95
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
