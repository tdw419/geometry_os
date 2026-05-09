; DESCRIPTION: Composite: Renders a green disk with center (97, 176) and radius 50 then Renders a orange line between points (110, 227) and (465, 139) then Sets a single yellow pixel at (476, 182).
; PLAN: r0=97(x), r1=176(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x1), r6=227(y1), r7=465(x2), r8=139(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=182(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 176
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 227
LDI r7, 465
LDI r8, 139
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 182
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
