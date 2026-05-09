; DESCRIPTION: Composite: Draws a orange circle centered at (384, 101) with radius 70 then Sets a single orange pixel at (235, 222) then Draws a black line from (468, 169) to (395, 180).
; PLAN: r0=384(x), r1=101(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=222(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=468(x1), r11=169(y1), r12=395(x2), r13=180(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 101
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 222
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 468
LDI r11, 169
LDI r12, 395
LDI r13, 180
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
