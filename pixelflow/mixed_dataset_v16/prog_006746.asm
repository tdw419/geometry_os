; DESCRIPTION: Composite: Renders a red line between points (249, 216) and (70, 123) then Sets a single black pixel at (453, 212) then Places a magenta circle of radius 57 at center (139, 152).
; PLAN: r0=249(x1), r1=216(y1), r2=70(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=212(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=139(x), r11=152(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 216
LDI r2, 70
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 212
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 139
LDI r11, 152
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
