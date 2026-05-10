; DESCRIPTION: Composite: Places a black dot at position (61, 156) then Draws a purple line from (229, 60) to (248, 148) then Places a green circle of radius 73 at center (346, 79).
; PLAN: r0=61(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=229(x1), r6=60(y1), r7=248(x2), r8=148(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=346(x), r11=79(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 229
LDI r6, 60
LDI r7, 248
LDI r8, 148
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 79
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
