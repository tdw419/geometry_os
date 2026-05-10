; DESCRIPTION: Draws a magenta rectangle at (321, 32) with width 21 and height 36.
; PLAN: r0=321(x), r1=32(y), r2=21(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 32
LDI r2, 21
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
