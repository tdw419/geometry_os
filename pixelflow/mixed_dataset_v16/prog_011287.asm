; DESCRIPTION: Composite: Places a red dot at position (327, 111) then Renders a green disk with center (171, 186) and radius 20 then Places a black line segment connecting (484, 147) to (379, 66).
; PLAN: r0=327(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=186(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x1), r11=147(y1), r12=379(x2), r13=66(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 171
LDI r6, 186
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 147
LDI r12, 379
LDI r13, 66
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
