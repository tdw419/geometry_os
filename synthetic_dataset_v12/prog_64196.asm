; DESCRIPTION: Composite: Renders a red disk with center (289, 75) and radius 44 then Sets a single black pixel at (356, 95) then Places a blue line segment connecting (415, 26) to (245, 197).
; PLAN: r0=289(x), r1=75(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=95(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=415(x1), r11=26(y1), r12=245(x2), r13=197(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 75
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 95
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 415
LDI r11, 26
LDI r12, 245
LDI r13, 197
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
