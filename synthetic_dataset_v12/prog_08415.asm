; DESCRIPTION: Composite: Renders a red line between points (498, 33) and (258, 169) then Sets a single cyan pixel at (379, 202) then Places a white circle of radius 74 at center (353, 126).
; PLAN: r0=498(x1), r1=33(y1), r2=258(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=202(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=353(x), r11=126(y), r12=74(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 33
LDI r2, 258
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 202
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 353
LDI r11, 126
LDI r12, 74
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
