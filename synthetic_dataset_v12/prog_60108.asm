; DESCRIPTION: Composite: Renders a white disk with center (96, 97) and radius 80 then Renders a red line between points (490, 102) and (187, 114) then Sets a single white pixel at (37, 147).
; PLAN: r0=96(x), r1=97(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=102(y1), r7=187(x2), r8=114(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=147(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 97
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 102
LDI r7, 187
LDI r8, 114
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 147
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
