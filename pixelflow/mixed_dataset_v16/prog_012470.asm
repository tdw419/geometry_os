; DESCRIPTION: Composite: Places a yellow dot at position (47, 201) then Draws a cyan circle centered at (227, 156) with radius 75 then Places a yellow line segment connecting (95, 107) to (29, 17).
; PLAN: r0=47(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=156(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x1), r11=107(y1), r12=29(x2), r13=17(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 227
LDI r6, 156
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 107
LDI r12, 29
LDI r13, 17
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
