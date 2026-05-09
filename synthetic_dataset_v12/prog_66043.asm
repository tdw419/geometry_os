; DESCRIPTION: Composite: Sets a single magenta pixel at (74, 144) then Places a blue circle of radius 79 at center (344, 112) then Places a purple line segment connecting (449, 188) to (36, 24).
; PLAN: r0=74(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=112(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=449(x1), r11=188(y1), r12=36(x2), r13=24(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 112
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 449
LDI r11, 188
LDI r12, 36
LDI r13, 24
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
