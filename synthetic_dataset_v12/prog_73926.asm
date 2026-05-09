; DESCRIPTION: Composite: Creates a cyan circular shape at (159, 156) with radius 51 then Places a white dot at position (95, 145) then Places a white line segment connecting (342, 147) to (0, 12).
; PLAN: r0=159(x), r1=156(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=145(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=342(x1), r11=147(y1), r12=0(x2), r13=12(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 156
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 145
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 147
LDI r12, 0
LDI r13, 12
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
