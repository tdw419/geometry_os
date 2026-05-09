; DESCRIPTION: Composite: Places a black circle of radius 36 at center (229, 119) then Places a orange line segment connecting (250, 200) to (44, 225).
; PLAN: r0=229(x), r1=119(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=200(y1), r7=44(x2), r8=225(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 119
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 200
LDI r7, 44
LDI r8, 225
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
