; DESCRIPTION: Composite: Places a yellow line segment connecting (127, 82) to (443, 189) then Places a orange dot at position (260, 186) then Places a yellow circle of radius 63 at center (119, 89).
; PLAN: r0=127(x1), r1=82(y1), r2=443(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=186(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=119(x), r11=89(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 127
LDI r1, 82
LDI r2, 443
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 186
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 119
LDI r11, 89
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
