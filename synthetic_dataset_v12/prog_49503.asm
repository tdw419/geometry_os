; DESCRIPTION: Draws a magenta rectangle at (237, 140) with width 108 and height 116.
; PLAN: r0=237(x), r1=140(y), r2=108(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 140
LDI r2, 108
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
