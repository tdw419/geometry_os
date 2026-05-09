; DESCRIPTION: Draws a magenta rectangle at (412, 45) with width 97 and height 77.
; PLAN: r0=412(x), r1=45(y), r2=97(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 45
LDI r2, 97
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
