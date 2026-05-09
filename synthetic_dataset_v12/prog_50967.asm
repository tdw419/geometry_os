; DESCRIPTION: Composite: Places a black dot at position (169, 64) then Places a cyan circle of radius 66 at center (332, 104) then Renders a green line between points (498, 180) and (145, 160).
; PLAN: r0=169(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=104(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x1), r11=180(y1), r12=145(x2), r13=160(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 104
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 180
LDI r12, 145
LDI r13, 160
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
