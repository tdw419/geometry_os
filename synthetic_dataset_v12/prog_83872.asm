; DESCRIPTION: Composite: Draws a yellow line from (508, 41) to (311, 197) then Places a yellow circle of radius 36 at center (335, 57) then Places a black dot at position (110, 237).
; PLAN: r0=508(x1), r1=41(y1), r2=311(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=57(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=110(x), r11=237(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 508
LDI r1, 41
LDI r2, 311
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 57
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 110
LDI r11, 237
LDI r12, 0x000000
PSET r10, r11, r12
HALT
