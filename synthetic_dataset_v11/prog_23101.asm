; DESCRIPTION: Draws a magenta rectangle at (124, 134) with width 71 and height 69.
; PLAN: r0=124(x), r1=134(y), r2=71(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 134
LDI r2, 71
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
