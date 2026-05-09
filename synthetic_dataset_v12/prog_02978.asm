; DESCRIPTION: Composite: Renders a red disk with center (304, 96) and radius 23 then Sets a single orange pixel at (119, 200) then Places a black line segment connecting (460, 183) to (71, 140).
; PLAN: r0=304(x), r1=96(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=200(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=460(x1), r11=183(y1), r12=71(x2), r13=140(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 96
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 200
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 460
LDI r11, 183
LDI r12, 71
LDI r13, 140
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
