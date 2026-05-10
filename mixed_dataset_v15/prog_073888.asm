; DESCRIPTION: Composite: Places a purple dot at position (143, 170) then Creates a black circular shape at (261, 75) with radius 57 then Places a red line segment connecting (89, 243) to (214, 121).
; PLAN: r0=143(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=75(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=89(x1), r11=243(y1), r12=214(x2), r13=121(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 170
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 75
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 89
LDI r11, 243
LDI r12, 214
LDI r13, 121
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
