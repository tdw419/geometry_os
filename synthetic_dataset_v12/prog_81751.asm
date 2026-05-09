; DESCRIPTION: Composite: Places a yellow line segment connecting (295, 208) to (44, 14) then Creates a green circular shape at (98, 145) with radius 72 then Sets a single yellow pixel at (57, 173).
; PLAN: r0=295(x1), r1=208(y1), r2=44(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=145(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=173(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 208
LDI r2, 44
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 145
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 173
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
