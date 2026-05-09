; DESCRIPTION: Composite: Renders a purple disk with center (344, 68) and radius 58 then Sets a single purple pixel at (299, 47) then Places a yellow line segment connecting (450, 89) to (177, 3).
; PLAN: r0=344(x), r1=68(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=47(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=450(x1), r11=89(y1), r12=177(x2), r13=3(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 68
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 47
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 450
LDI r11, 89
LDI r12, 177
LDI r13, 3
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
