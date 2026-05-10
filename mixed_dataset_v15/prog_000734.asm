; DESCRIPTION: Composite: Sets a single yellow pixel at (105, 104) then Creates a white circular shape at (400, 55) with radius 31 then Draws a white line from (31, 71) to (478, 218).
; PLAN: r0=105(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=55(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x1), r11=71(y1), r12=478(x2), r13=218(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 55
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 71
LDI r12, 478
LDI r13, 218
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
