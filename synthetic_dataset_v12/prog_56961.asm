; DESCRIPTION: Composite: Sets a single cyan pixel at (362, 119) then Renders a green line between points (389, 182) and (340, 50) then Creates a green circular shape at (210, 189) with radius 22.
; PLAN: r0=362(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=389(x1), r6=182(y1), r7=340(x2), r8=50(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=189(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 182
LDI r7, 340
LDI r8, 50
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 189
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
