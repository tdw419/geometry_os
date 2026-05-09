; DESCRIPTION: Draws a magenta rectangle at (117, 4) with width 48 and height 84.
; PLAN: r0=117(x), r1=4(y), r2=48(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 4
LDI r2, 48
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
