; DESCRIPTION: Draws a magenta rectangle at (274, 238) with width 45 and height 15.
; PLAN: r0=274(x), r1=238(y), r2=45(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 238
LDI r2, 45
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
