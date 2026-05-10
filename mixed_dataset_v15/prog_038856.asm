; DESCRIPTION: Composite: Draws a cyan line from (429, 45) to (36, 157) then Sets a single black pixel at (482, 180) then Creates a cyan circular shape at (121, 144) with radius 69.
; PLAN: r0=429(x1), r1=45(y1), r2=36(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=180(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=144(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 45
LDI r2, 36
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 180
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 121
LDI r11, 144
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
