; DESCRIPTION: Draws a magenta rectangle at (238, 202) with width 106 and height 37.
; PLAN: r0=238(x), r1=202(y), r2=106(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 202
LDI r2, 106
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
