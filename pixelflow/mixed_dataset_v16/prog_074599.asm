; DESCRIPTION: Draws a magenta rectangle at (203, 43) with width 71 and height 109.
; PLAN: r0=203(x), r1=43(y), r2=71(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 43
LDI r2, 71
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
