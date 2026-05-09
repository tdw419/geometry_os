; DESCRIPTION: Composite: Places a black circle of radius 80 at center (248, 128) then Draws a black line from (167, 110) to (470, 233) then Sets a single orange pixel at (434, 181).
; PLAN: r0=248(x), r1=128(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x1), r6=110(y1), r7=470(x2), r8=233(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=181(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 128
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 110
LDI r7, 470
LDI r8, 233
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 181
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
