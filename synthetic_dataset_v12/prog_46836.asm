; DESCRIPTION: Composite: Renders a purple line between points (35, 190) and (119, 179) then Places a blue circle of radius 59 at center (393, 175) then Sets a single blue pixel at (45, 33).
; PLAN: r0=35(x1), r1=190(y1), r2=119(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=175(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=33(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 190
LDI r2, 119
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 175
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 33
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
