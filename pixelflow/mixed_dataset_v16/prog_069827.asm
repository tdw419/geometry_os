; DESCRIPTION: Draws a magenta rectangle at (278, 30) with width 40 and height 51.
; PLAN: r0=278(x), r1=30(y), r2=40(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 30
LDI r2, 40
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
