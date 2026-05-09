; DESCRIPTION: Draws a magenta rectangle at (139, 180) with width 57 and height 69.
; PLAN: r0=139(x), r1=180(y), r2=57(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 180
LDI r2, 57
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
