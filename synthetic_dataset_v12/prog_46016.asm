; DESCRIPTION: Draws a magenta rectangle at (419, 83) with width 10 and height 65.
; PLAN: r0=419(x), r1=83(y), r2=10(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 83
LDI r2, 10
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
