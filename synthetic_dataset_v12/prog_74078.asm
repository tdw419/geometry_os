; DESCRIPTION: Composite: Draws a black circle centered at (340, 199) with radius 26 then Renders a black line between points (356, 180) and (208, 105) then Sets a single purple pixel at (360, 104).
; PLAN: r0=340(x), r1=199(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x1), r6=180(y1), r7=208(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=104(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 199
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 180
LDI r7, 208
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 104
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
