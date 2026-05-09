; DESCRIPTION: Composite: Renders a purple disk with center (286, 139) and radius 79 then Places a black line segment connecting (508, 138) to (202, 157) then Sets a single blue pixel at (434, 199).
; PLAN: r0=286(x), r1=139(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x1), r6=138(y1), r7=202(x2), r8=157(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=199(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 139
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 138
LDI r7, 202
LDI r8, 157
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 199
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
