; DESCRIPTION: Draws a magenta rectangle at (247, 75) with width 98 and height 83.
; PLAN: r0=247(x), r1=75(y), r2=98(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 75
LDI r2, 98
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
