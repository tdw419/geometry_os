; DESCRIPTION: Draws a magenta rectangle at (170, 203) with width 12 and height 26.
; PLAN: r0=170(x), r1=203(y), r2=12(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 203
LDI r2, 12
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
