; DESCRIPTION: Draws a magenta rectangle at (418, 36) with width 84 and height 18.
; PLAN: r0=418(x), r1=36(y), r2=84(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 36
LDI r2, 84
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
