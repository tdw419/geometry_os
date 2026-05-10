; DESCRIPTION: Composite: Draws a cyan circle centered at (148, 164) with radius 49 then Renders a green line between points (325, 134) and (336, 89) then Places a white dot at position (399, 147).
; PLAN: r0=148(x), r1=164(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x1), r6=134(y1), r7=336(x2), r8=89(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=147(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 164
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 134
LDI r7, 336
LDI r8, 89
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 147
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
