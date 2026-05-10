; DESCRIPTION: Composite: Sets a single purple pixel at (134, 10) then Draws a yellow line from (242, 169) to (208, 195) then Draws a green circle centered at (433, 78) with radius 75.
; PLAN: r0=134(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=169(y1), r7=208(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=78(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 169
LDI r7, 208
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 78
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
