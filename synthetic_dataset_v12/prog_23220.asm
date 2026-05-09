; DESCRIPTION: Draws a magenta rectangle at (159, 224) with width 90 and height 11.
; PLAN: r0=159(x), r1=224(y), r2=90(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 224
LDI r2, 90
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
