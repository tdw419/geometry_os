; DESCRIPTION: Composite: Places a green line segment connecting (349, 171) to (384, 115) then Sets a single orange pixel at (24, 51) then Places a yellow circle of radius 41 at center (398, 201).
; PLAN: r0=349(x1), r1=171(y1), r2=384(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=51(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=398(x), r11=201(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 171
LDI r2, 384
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 51
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 398
LDI r11, 201
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
