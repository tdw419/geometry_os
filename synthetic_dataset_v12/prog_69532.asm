; DESCRIPTION: Composite: Places a cyan circle of radius 73 at center (398, 159) then Sets a single black pixel at (150, 11) then Renders a green line between points (195, 43) and (272, 81).
; PLAN: r0=398(x), r1=159(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=195(x1), r11=43(y1), r12=272(x2), r13=81(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 159
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 195
LDI r11, 43
LDI r12, 272
LDI r13, 81
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
