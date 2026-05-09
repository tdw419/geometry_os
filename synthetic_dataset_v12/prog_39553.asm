; DESCRIPTION: Composite: Draws a black line from (261, 70) to (496, 107) then Places a red dot at position (372, 75) then Creates a cyan circular shape at (252, 192) with radius 57.
; PLAN: r0=261(x1), r1=70(y1), r2=496(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=75(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=192(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 70
LDI r2, 496
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 75
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 252
LDI r11, 192
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
