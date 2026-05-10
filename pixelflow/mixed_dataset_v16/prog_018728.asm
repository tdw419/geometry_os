; DESCRIPTION: Draws a magenta rectangle at (150, 83) with width 36 and height 101.
; PLAN: r0=150(x), r1=83(y), r2=36(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 83
LDI r2, 36
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
