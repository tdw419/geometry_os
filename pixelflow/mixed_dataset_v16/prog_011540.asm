; DESCRIPTION: Composite: Renders a red disk with center (311, 147) and radius 80 then Sets a single green pixel at (134, 27) then Renders a green line between points (282, 161) and (140, 206).
; PLAN: r0=311(x), r1=147(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=27(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=282(x1), r11=161(y1), r12=140(x2), r13=206(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 147
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 27
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 282
LDI r11, 161
LDI r12, 140
LDI r13, 206
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
