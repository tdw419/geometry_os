; DESCRIPTION: Draws a magenta rectangle at (408, 204) with width 56 and height 24.
; PLAN: r0=408(x), r1=204(y), r2=56(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 204
LDI r2, 56
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
