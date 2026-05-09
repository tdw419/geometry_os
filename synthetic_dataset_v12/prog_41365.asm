; DESCRIPTION: Draws a magenta rectangle at (184, 23) with width 75 and height 87.
; PLAN: r0=184(x), r1=23(y), r2=75(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 23
LDI r2, 75
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
