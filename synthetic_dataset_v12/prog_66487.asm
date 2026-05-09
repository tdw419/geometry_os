; DESCRIPTION: Draws a magenta rectangle at (110, 82) with width 25 and height 119.
; PLAN: r0=110(x), r1=82(y), r2=25(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 82
LDI r2, 25
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
