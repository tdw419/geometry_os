; DESCRIPTION: Draws a magenta rectangle at (385, 177) with width 93 and height 68.
; PLAN: r0=385(x), r1=177(y), r2=93(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 177
LDI r2, 93
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
