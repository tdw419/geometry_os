; DESCRIPTION: Composite: Renders a purple line between points (474, 120) and (355, 139) then Renders a white disk with center (56, 87) and radius 38 then Sets a single magenta pixel at (496, 46).
; PLAN: r0=474(x1), r1=120(y1), r2=355(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=87(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x), r11=46(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 474
LDI r1, 120
LDI r2, 355
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 87
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 46
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
