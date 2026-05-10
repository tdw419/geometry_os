; DESCRIPTION: Draws a magenta rectangle at (382, 16) with width 110 and height 117.
; PLAN: r0=382(x), r1=16(y), r2=110(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 16
LDI r2, 110
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
