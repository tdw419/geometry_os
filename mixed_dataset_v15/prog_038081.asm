; DESCRIPTION: Composite: Places a white dot at position (449, 93) then Renders a green disk with center (355, 65) and radius 34 then Renders a white line between points (357, 219) and (494, 201).
; PLAN: r0=449(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=65(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x1), r11=219(y1), r12=494(x2), r13=201(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 65
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 219
LDI r12, 494
LDI r13, 201
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
