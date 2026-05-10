; DESCRIPTION: Draws a magenta rectangle at (345, 76) with width 50 and height 47.
; PLAN: r0=345(x), r1=76(y), r2=50(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 76
LDI r2, 50
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
