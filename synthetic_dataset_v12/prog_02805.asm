; DESCRIPTION: Composite: Renders a black disk with center (266, 153) and radius 22 then Places a white line segment connecting (433, 155) to (181, 51) then Places a white dot at position (75, 22).
; PLAN: r0=266(x), r1=153(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=155(y1), r7=181(x2), r8=51(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=22(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 153
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 155
LDI r7, 181
LDI r8, 51
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 22
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
