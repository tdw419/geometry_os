; DESCRIPTION: Composite: Sets a single blue pixel at (164, 109) then Places a white circle of radius 73 at center (417, 110) then Renders a white line between points (163, 186) and (355, 231).
; PLAN: r0=164(x), r1=109(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=110(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=186(y1), r12=355(x2), r13=231(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 109
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 417
LDI r6, 110
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 186
LDI r12, 355
LDI r13, 231
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
