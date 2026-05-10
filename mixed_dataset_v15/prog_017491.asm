; DESCRIPTION: Composite: Renders a yellow disk with center (419, 128) and radius 29 then Sets a single purple pixel at (476, 145) then Renders a yellow line between points (186, 210) and (62, 72).
; PLAN: r0=419(x), r1=128(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=145(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=186(x1), r11=210(y1), r12=62(x2), r13=72(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 128
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 145
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 186
LDI r11, 210
LDI r12, 62
LDI r13, 72
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
