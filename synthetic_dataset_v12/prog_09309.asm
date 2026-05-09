; DESCRIPTION: Composite: Sets a single red pixel at (266, 20) then Places a yellow circle of radius 41 at center (250, 196) then Renders a white line between points (0, 200) and (247, 220).
; PLAN: r0=266(x), r1=20(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=196(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x1), r11=200(y1), r12=247(x2), r13=220(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 20
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 250
LDI r6, 196
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 200
LDI r12, 247
LDI r13, 220
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
