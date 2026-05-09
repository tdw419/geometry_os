; DESCRIPTION: Composite: Places a yellow circle of radius 22 at center (54, 52) then Sets a single purple pixel at (297, 110) then Places a magenta line segment connecting (493, 130) to (489, 242).
; PLAN: r0=54(x), r1=52(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=297(x), r6=110(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=493(x1), r11=130(y1), r12=489(x2), r13=242(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 52
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 297
LDI r6, 110
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 493
LDI r11, 130
LDI r12, 489
LDI r13, 242
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
