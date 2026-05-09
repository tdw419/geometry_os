; DESCRIPTION: Composite: Places a magenta line segment connecting (36, 230) to (102, 156) then Creates a blue circular shape at (200, 169) with radius 29 then Sets a single blue pixel at (480, 242).
; PLAN: r0=36(x1), r1=230(y1), r2=102(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=169(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=480(x), r11=242(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 230
LDI r2, 102
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 169
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 480
LDI r11, 242
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
