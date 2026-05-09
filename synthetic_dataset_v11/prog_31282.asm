; DESCRIPTION: Draws a magenta rectangle at (7, 69) with width 71 and height 93.
; PLAN: r0=7(x), r1=69(y), r2=71(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 69
LDI r2, 71
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
