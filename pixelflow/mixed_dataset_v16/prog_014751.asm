; DESCRIPTION: Composite: Draws a magenta rectangle at (377, 132) with width 87 and height 33 then Draws a magenta circle centered at (153, 89) with radius 33.
; PLAN: r0=377(x), r1=132(y), r2=87(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=89(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 132
LDI r2, 87
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 89
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
