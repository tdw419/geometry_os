; DESCRIPTION: Composite: Renders a black line between points (0, 192) and (468, 18) then Renders a orange disk with center (342, 194) and radius 55.
; PLAN: r0=0(x1), r1=192(y1), r2=468(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=194(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 192
LDI r2, 468
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 194
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
