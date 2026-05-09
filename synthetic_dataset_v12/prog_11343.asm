; DESCRIPTION: Composite: Renders a black disk with center (147, 172) and radius 80 then Places a white dot at position (382, 160) then Renders a purple line between points (410, 116) and (144, 78).
; PLAN: r0=147(x), r1=172(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=160(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=410(x1), r11=116(y1), r12=144(x2), r13=78(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 172
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 160
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 410
LDI r11, 116
LDI r12, 144
LDI r13, 78
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
