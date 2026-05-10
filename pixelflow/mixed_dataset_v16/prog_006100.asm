; DESCRIPTION: Composite: Renders a orange disk with center (222, 164) and radius 18 then Renders a red line between points (131, 189) and (225, 10) then Sets a single cyan pixel at (30, 58).
; PLAN: r0=222(x), r1=164(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x1), r6=189(y1), r7=225(x2), r8=10(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=58(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 164
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 189
LDI r7, 225
LDI r8, 10
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 58
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
