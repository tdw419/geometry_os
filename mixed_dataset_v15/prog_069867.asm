; DESCRIPTION: Composite: Places a white dot at position (106, 0) then Renders a red disk with center (283, 155) and radius 65 then Renders a orange line between points (195, 235) and (193, 129).
; PLAN: r0=106(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=155(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x1), r11=235(y1), r12=193(x2), r13=129(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 155
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 235
LDI r12, 193
LDI r13, 129
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
