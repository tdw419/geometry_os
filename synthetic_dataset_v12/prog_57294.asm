; DESCRIPTION: Composite: Creates a yellow circular shape at (208, 204) with radius 40 then Sets a single magenta pixel at (211, 112) then Renders a blue line between points (396, 14) and (186, 108).
; PLAN: r0=208(x), r1=204(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=112(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=396(x1), r11=14(y1), r12=186(x2), r13=108(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 204
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 112
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 14
LDI r12, 186
LDI r13, 108
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
