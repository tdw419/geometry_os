; DESCRIPTION: Composite: Draws a cyan line from (314, 79) to (253, 167) then Sets a single purple pixel at (244, 197) then Draws a black circle centered at (340, 154) with radius 50.
; PLAN: r0=314(x1), r1=79(y1), r2=253(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=197(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=154(y), r12=50(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 79
LDI r2, 253
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 197
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 154
LDI r12, 50
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
