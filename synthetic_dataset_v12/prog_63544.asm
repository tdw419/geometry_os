; DESCRIPTION: Composite: Renders a black line between points (496, 104) and (419, 89) then Creates a green circular shape at (385, 48) with radius 27 then Sets a single cyan pixel at (492, 40).
; PLAN: r0=496(x1), r1=104(y1), r2=419(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=48(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x), r11=40(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 496
LDI r1, 104
LDI r2, 419
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 48
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 40
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
