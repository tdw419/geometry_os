; DESCRIPTION: Composite: Renders a black line between points (419, 40) and (335, 167) then Places a white circle of radius 41 at center (165, 91) then Sets a single white pixel at (208, 180).
; PLAN: r0=419(x1), r1=40(y1), r2=335(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=91(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x), r11=180(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 40
LDI r2, 335
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 91
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 180
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
