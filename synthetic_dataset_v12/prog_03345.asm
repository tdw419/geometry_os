; DESCRIPTION: Composite: Draws a magenta circle centered at (390, 138) with radius 75 then Places a blue line segment connecting (414, 87) to (173, 202).
; PLAN: r0=390(x), r1=138(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=87(y1), r7=173(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 138
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 87
LDI r7, 173
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
