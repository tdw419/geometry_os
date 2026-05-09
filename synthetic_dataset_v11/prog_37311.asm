; DESCRIPTION: Draws a magenta rectangle at (12, 116) with width 69 and height 46.
; PLAN: r0=12(x), r1=116(y), r2=69(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 116
LDI r2, 69
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
