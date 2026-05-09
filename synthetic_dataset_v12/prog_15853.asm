; DESCRIPTION: Composite: Sets a single yellow pixel at (8, 47) then Draws a black circle centered at (129, 17) with radius 14 then Draws a orange line from (400, 143) to (84, 94).
; PLAN: r0=8(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=17(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x1), r11=143(y1), r12=84(x2), r13=94(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 129
LDI r6, 17
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 143
LDI r12, 84
LDI r13, 94
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
