; DESCRIPTION: Draws a magenta rectangle at (159, 171) with width 49 and height 78.
; PLAN: r0=159(x), r1=171(y), r2=49(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 171
LDI r2, 49
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
