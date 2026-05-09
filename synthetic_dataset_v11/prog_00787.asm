; DESCRIPTION: Draws a magenta rectangle at (32, 34) with width 35 and height 83.
; PLAN: r0=32(x), r1=34(y), r2=35(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 34
LDI r2, 35
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
