; DESCRIPTION: Composite: Draws a orange circle centered at (90, 141) with radius 25 then Sets a single yellow pixel at (92, 215) then Draws a orange line from (85, 198) to (347, 40).
; PLAN: r0=90(x), r1=141(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=215(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=85(x1), r11=198(y1), r12=347(x2), r13=40(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 90
LDI r1, 141
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 215
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 85
LDI r11, 198
LDI r12, 347
LDI r13, 40
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
