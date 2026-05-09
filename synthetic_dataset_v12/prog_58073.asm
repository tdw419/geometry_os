; DESCRIPTION: Composite: Places a green circle of radius 49 at center (267, 145) then Places a green line segment connecting (300, 166) to (419, 18) then Sets a single blue pixel at (232, 165).
; PLAN: r0=267(x), r1=145(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=166(y1), r7=419(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=165(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 145
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 166
LDI r7, 419
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 165
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
