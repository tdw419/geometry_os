; DESCRIPTION: Composite: Draws a yellow line from (465, 16) to (378, 80) then Creates a green circular shape at (43, 150) with radius 27 then Sets a single yellow pixel at (341, 186).
; PLAN: r0=465(x1), r1=16(y1), r2=378(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=150(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=341(x), r11=186(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 16
LDI r2, 378
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 150
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 341
LDI r11, 186
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
