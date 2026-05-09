; DESCRIPTION: Composite: Places a purple circle of radius 79 at center (293, 156) then Renders a green line between points (252, 129) and (308, 158) then Places a black dot at position (254, 247).
; PLAN: r0=293(x), r1=156(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x1), r6=129(y1), r7=308(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=247(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 156
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 129
LDI r7, 308
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 247
LDI r12, 0x000000
PSET r10, r11, r12
HALT
