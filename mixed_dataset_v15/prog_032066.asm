; DESCRIPTION: Composite: Renders a cyan line between points (6, 109) and (306, 147) then Places a green circle of radius 50 at center (61, 118) then Sets a single white pixel at (336, 36).
; PLAN: r0=6(x1), r1=109(y1), r2=306(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=118(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=336(x), r11=36(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 109
LDI r2, 306
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 118
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 336
LDI r11, 36
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
