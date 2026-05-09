; DESCRIPTION: Composite: Sets a single blue pixel at (504, 170) then Renders a red line between points (61, 163) and (327, 112) then Draws a black circle centered at (440, 69) with radius 69.
; PLAN: r0=504(x), r1=170(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=163(y1), r7=327(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=69(y), r12=69(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 170
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 61
LDI r6, 163
LDI r7, 327
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 69
LDI r12, 69
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
