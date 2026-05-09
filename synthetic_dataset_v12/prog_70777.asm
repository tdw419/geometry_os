; DESCRIPTION: Composite: Draws a yellow line from (369, 241) to (403, 89) then Renders a purple disk with center (133, 176) and radius 68 then Places a white dot at position (32, 201).
; PLAN: r0=369(x1), r1=241(y1), r2=403(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=176(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x), r11=201(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 241
LDI r2, 403
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 176
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 201
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
