; DESCRIPTION: Composite: Sets a single red pixel at (200, 214) then Renders a red disk with center (88, 110) and radius 41 then Renders a blue line between points (271, 41) and (8, 4).
; PLAN: r0=200(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=110(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x1), r11=41(y1), r12=8(x2), r13=4(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 88
LDI r6, 110
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 41
LDI r12, 8
LDI r13, 4
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
