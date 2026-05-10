; DESCRIPTION: Composite: Sets a single yellow pixel at (482, 11) then Draws a green circle centered at (87, 202) with radius 19 then Draws a orange line from (172, 105) to (214, 79).
; PLAN: r0=482(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=202(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=105(y1), r12=214(x2), r13=79(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 87
LDI r6, 202
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 105
LDI r12, 214
LDI r13, 79
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
