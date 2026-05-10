; DESCRIPTION: Composite: Sets a single cyan pixel at (455, 48) then Renders a black line between points (497, 144) and (366, 192) then Renders a black disk with center (331, 111) and radius 13.
; PLAN: r0=455(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=144(y1), r7=366(x2), r8=192(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=111(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 497
LDI r6, 144
LDI r7, 366
LDI r8, 192
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 111
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
