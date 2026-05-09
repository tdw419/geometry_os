; DESCRIPTION: Composite: Draws a red line from (197, 50) to (476, 180) then Sets a single green pixel at (49, 253) then Draws a red circle centered at (393, 112) with radius 14.
; PLAN: r0=197(x1), r1=50(y1), r2=476(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=253(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=112(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 50
LDI r2, 476
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 253
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 393
LDI r11, 112
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
