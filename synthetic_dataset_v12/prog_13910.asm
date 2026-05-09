; DESCRIPTION: Composite: Places a orange dot at position (131, 144) then Renders a yellow disk with center (41, 106) and radius 19 then Renders a white line between points (418, 43) and (35, 83).
; PLAN: r0=131(x), r1=144(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=106(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x1), r11=43(y1), r12=35(x2), r13=83(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 144
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 41
LDI r6, 106
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 43
LDI r12, 35
LDI r13, 83
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
