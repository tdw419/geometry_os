; DESCRIPTION: Composite: Renders a purple line between points (148, 133) and (275, 241) then Places a blue dot at position (474, 29) then Renders a cyan disk with center (116, 20) and radius 20.
; PLAN: r0=148(x1), r1=133(y1), r2=275(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=474(x), r6=29(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=116(x), r11=20(y), r12=20(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 133
LDI r2, 275
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 29
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 116
LDI r11, 20
LDI r12, 20
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
