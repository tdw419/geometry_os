; DESCRIPTION: Composite: Sets a single yellow pixel at (402, 79) then Renders a green disk with center (314, 97) and radius 31 then Renders a green line between points (35, 16) and (90, 99).
; PLAN: r0=402(x), r1=79(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=97(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x1), r11=16(y1), r12=90(x2), r13=99(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 79
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 314
LDI r6, 97
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 16
LDI r12, 90
LDI r13, 99
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
