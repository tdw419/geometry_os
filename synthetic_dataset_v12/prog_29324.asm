; DESCRIPTION: Composite: Places a black circle of radius 51 at center (81, 95) then Sets a single cyan pixel at (296, 245) then Renders a blue line between points (422, 218) and (419, 223).
; PLAN: r0=81(x), r1=95(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=245(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=422(x1), r11=218(y1), r12=419(x2), r13=223(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 95
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 245
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 422
LDI r11, 218
LDI r12, 419
LDI r13, 223
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
