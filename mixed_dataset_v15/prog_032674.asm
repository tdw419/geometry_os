; DESCRIPTION: Composite: Renders a cyan line between points (314, 147) and (141, 199) then Places a green dot at position (295, 74) then Draws a cyan circle centered at (430, 118) with radius 49.
; PLAN: r0=314(x1), r1=147(y1), r2=141(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=74(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=118(y), r12=49(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 147
LDI r2, 141
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 74
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 430
LDI r11, 118
LDI r12, 49
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
