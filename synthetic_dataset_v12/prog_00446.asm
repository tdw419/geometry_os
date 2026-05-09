; DESCRIPTION: Composite: Sets a single yellow pixel at (241, 251) then Draws a black line from (156, 62) to (127, 221) then Renders a yellow disk with center (396, 63) and radius 55.
; PLAN: r0=241(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=156(x1), r6=62(y1), r7=127(x2), r8=221(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=63(y), r12=55(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 241
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 156
LDI r6, 62
LDI r7, 127
LDI r8, 221
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 63
LDI r12, 55
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
