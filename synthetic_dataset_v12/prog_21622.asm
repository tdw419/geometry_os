; DESCRIPTION: Draws a magenta rectangle at (408, 24) with width 60 and height 110.
; PLAN: r0=408(x), r1=24(y), r2=60(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 24
LDI r2, 60
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
