; DESCRIPTION: Draws a magenta rectangle at (274, 98) with width 31 and height 78.
; PLAN: r0=274(x), r1=98(y), r2=31(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 98
LDI r2, 31
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
