; DESCRIPTION: Draws a magenta rectangle at (233, 65) with width 115 and height 64.
; PLAN: r0=233(x), r1=65(y), r2=115(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 65
LDI r2, 115
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
