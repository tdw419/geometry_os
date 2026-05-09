; DESCRIPTION: Composite: Draws a black line from (57, 124) to (46, 160) then Places a orange circle of radius 45 at center (197, 141) then Sets a single red pixel at (95, 104).
; PLAN: r0=57(x1), r1=124(y1), r2=46(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=141(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=104(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 57
LDI r1, 124
LDI r2, 46
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 141
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 104
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
