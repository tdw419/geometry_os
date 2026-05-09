; DESCRIPTION: Composite: Sets a single purple pixel at (463, 185) then Places a purple circle of radius 54 at center (357, 123) then Renders a magenta line between points (250, 214) and (182, 44).
; PLAN: r0=463(x), r1=185(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=123(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x1), r11=214(y1), r12=182(x2), r13=44(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 185
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 123
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 214
LDI r12, 182
LDI r13, 44
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
