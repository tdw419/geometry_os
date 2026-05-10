; DESCRIPTION: Composite: Places a orange dot at position (208, 173) then Renders a white line between points (247, 225) and (447, 86) then Creates a purple circular shape at (313, 109) with radius 20.
; PLAN: r0=208(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=225(y1), r7=447(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=109(y), r12=20(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 247
LDI r6, 225
LDI r7, 447
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 109
LDI r12, 20
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
