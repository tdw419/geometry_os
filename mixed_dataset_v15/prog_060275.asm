; DESCRIPTION: Composite: Sets a single black pixel at (281, 14) then Draws a green line from (452, 177) to (164, 95) then Creates a white circular shape at (142, 137) with radius 20.
; PLAN: r0=281(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=177(y1), r7=164(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=137(y), r12=20(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 14
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 452
LDI r6, 177
LDI r7, 164
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 137
LDI r12, 20
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
