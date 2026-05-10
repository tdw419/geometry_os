; DESCRIPTION: Composite: Sets a single yellow pixel at (493, 144) then Places a blue circle of radius 25 at center (169, 92) then Renders a magenta line between points (252, 26) and (229, 96).
; PLAN: r0=493(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=92(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x1), r11=26(y1), r12=229(x2), r13=96(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 144
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 92
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 26
LDI r12, 229
LDI r13, 96
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
