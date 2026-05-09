; DESCRIPTION: Draws a magenta rectangle at (383, 8) with width 57 and height 66.
; PLAN: r0=383(x), r1=8(y), r2=57(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 8
LDI r2, 57
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
