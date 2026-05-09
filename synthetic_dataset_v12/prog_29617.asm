; DESCRIPTION: Composite: Sets a single orange pixel at (73, 214) then Draws a black line from (218, 128) to (475, 194) then Draws a orange circle centered at (157, 177) with radius 54.
; PLAN: r0=73(x), r1=214(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=218(x1), r6=128(y1), r7=475(x2), r8=194(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=177(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 214
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 218
LDI r6, 128
LDI r7, 475
LDI r8, 194
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 177
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
