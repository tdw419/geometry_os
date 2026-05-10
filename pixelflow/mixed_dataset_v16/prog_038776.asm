; DESCRIPTION: Composite: Places a yellow dot at position (331, 41) then Renders a green line between points (438, 22) and (358, 188) then Places a black circle of radius 23 at center (341, 27).
; PLAN: r0=331(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=22(y1), r7=358(x2), r8=188(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=27(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 438
LDI r6, 22
LDI r7, 358
LDI r8, 188
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 27
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
