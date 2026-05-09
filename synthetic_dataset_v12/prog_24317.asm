; DESCRIPTION: Composite: Places a white circle of radius 62 at center (314, 171) then Places a white dot at position (251, 162) then Places a green line segment connecting (31, 182) to (333, 13).
; PLAN: r0=314(x), r1=171(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=162(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=31(x1), r11=182(y1), r12=333(x2), r13=13(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 171
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 162
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 31
LDI r11, 182
LDI r12, 333
LDI r13, 13
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
