; DESCRIPTION: Draws a magenta rectangle at (220, 96) with width 23 and height 31.
; PLAN: r0=220(x), r1=96(y), r2=23(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 96
LDI r2, 23
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
