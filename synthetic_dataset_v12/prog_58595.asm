; DESCRIPTION: Composite: Renders a yellow disk with center (356, 171) and radius 53 then Renders a purple line between points (186, 78) and (355, 28) then Sets a single black pixel at (400, 184).
; PLAN: r0=356(x), r1=171(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x1), r6=78(y1), r7=355(x2), r8=28(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=184(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 171
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 78
LDI r7, 355
LDI r8, 28
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 184
LDI r12, 0x000000
PSET r10, r11, r12
HALT
