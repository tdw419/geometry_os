; DESCRIPTION: Draws a magenta rectangle at (352, 23) with width 80 and height 23.
; PLAN: r0=352(x), r1=23(y), r2=80(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 23
LDI r2, 80
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
