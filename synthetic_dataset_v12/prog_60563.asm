; DESCRIPTION: Draws a magenta rectangle at (317, 159) with width 119 and height 15.
; PLAN: r0=317(x), r1=159(y), r2=119(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 159
LDI r2, 119
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
