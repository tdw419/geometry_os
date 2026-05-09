; DESCRIPTION: Composite: Sets a single red pixel at (334, 45) then Places a red circle of radius 80 at center (318, 95) then Renders a white line between points (78, 88) and (38, 196).
; PLAN: r0=334(x), r1=45(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=95(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x1), r11=88(y1), r12=38(x2), r13=196(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 45
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 318
LDI r6, 95
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 88
LDI r12, 38
LDI r13, 196
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
