; DESCRIPTION: Composite: Creates a yellow circular shape at (281, 201) with radius 25 then Places a black line segment connecting (459, 9) to (481, 220) then Sets a single yellow pixel at (391, 140).
; PLAN: r0=281(x), r1=201(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=9(y1), r7=481(x2), r8=220(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=140(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 201
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 9
LDI r7, 481
LDI r8, 220
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 140
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
