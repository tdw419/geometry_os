; DESCRIPTION: Draws a magenta rectangle at (110, 157) with width 74 and height 32.
; PLAN: r0=110(x), r1=157(y), r2=74(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 157
LDI r2, 74
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
