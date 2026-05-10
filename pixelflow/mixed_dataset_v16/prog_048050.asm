; DESCRIPTION: Composite: Sets a single red pixel at (11, 67) then Creates a blue circular shape at (140, 110) with radius 71 then Renders a red line between points (139, 17) and (382, 68).
; PLAN: r0=11(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=110(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x1), r11=17(y1), r12=382(x2), r13=68(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 140
LDI r6, 110
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 17
LDI r12, 382
LDI r13, 68
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
