; DESCRIPTION: Draws a magenta rectangle at (204, 22) with width 93 and height 39.
; PLAN: r0=204(x), r1=22(y), r2=93(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 22
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
