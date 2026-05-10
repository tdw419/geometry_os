; DESCRIPTION: Composite: Creates a red circular shape at (340, 98) with radius 71 then Places a green dot at position (415, 112) then Renders a purple line between points (10, 147) and (347, 185).
; PLAN: r0=340(x), r1=98(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=10(x1), r11=147(y1), r12=347(x2), r13=185(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 98
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 10
LDI r11, 147
LDI r12, 347
LDI r13, 185
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
