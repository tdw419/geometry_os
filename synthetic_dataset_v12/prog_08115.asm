; DESCRIPTION: Draws a magenta rectangle at (321, 72) with width 23 and height 52.
; PLAN: r0=321(x), r1=72(y), r2=23(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 72
LDI r2, 23
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
