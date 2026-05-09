; DESCRIPTION: Composite: Creates a white circular shape at (156, 110) with radius 59 then Sets a single orange pixel at (398, 95) then Renders a black line between points (381, 58) and (253, 217).
; PLAN: r0=156(x), r1=110(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=95(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=381(x1), r11=58(y1), r12=253(x2), r13=217(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 110
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 95
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 381
LDI r11, 58
LDI r12, 253
LDI r13, 217
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
