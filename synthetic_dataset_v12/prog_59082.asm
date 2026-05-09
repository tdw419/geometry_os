; DESCRIPTION: Draws a magenta rectangle at (131, 10) with width 77 and height 17.
; PLAN: r0=131(x), r1=10(y), r2=77(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 10
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
