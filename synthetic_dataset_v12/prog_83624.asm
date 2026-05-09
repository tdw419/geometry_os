; DESCRIPTION: Composite: Draws a blue line from (474, 136) to (317, 225) then Draws a magenta circle centered at (311, 152) with radius 80.
; PLAN: r0=474(x1), r1=136(y1), r2=317(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=152(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 136
LDI r2, 317
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 152
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
