; DESCRIPTION: Composite: Places a magenta line segment connecting (84, 242) to (361, 17) then Draws a blue circle centered at (342, 73) with radius 43 then Sets a single blue pixel at (34, 178).
; PLAN: r0=84(x1), r1=242(y1), r2=361(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=73(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x), r11=178(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 242
LDI r2, 361
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 73
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 178
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
