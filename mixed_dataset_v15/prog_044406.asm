; DESCRIPTION: Composite: Renders a purple line between points (325, 196) and (95, 67) then Renders a purple disk with center (206, 162) and radius 51 then Sets a single red pixel at (291, 99).
; PLAN: r0=325(x1), r1=196(y1), r2=95(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=162(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=99(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 196
LDI r2, 95
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 162
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 99
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
