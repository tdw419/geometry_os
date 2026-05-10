; DESCRIPTION: Composite: Renders a orange disk with center (408, 105) and radius 33 then Renders a orange line between points (341, 241) and (495, 218).
; PLAN: r0=408(x), r1=105(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x1), r6=241(y1), r7=495(x2), r8=218(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 105
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 241
LDI r7, 495
LDI r8, 218
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
