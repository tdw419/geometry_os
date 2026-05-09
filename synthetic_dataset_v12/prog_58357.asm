; DESCRIPTION: Draws a magenta rectangle at (408, 112) with width 56 and height 26.
; PLAN: r0=408(x), r1=112(y), r2=56(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 112
LDI r2, 56
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
