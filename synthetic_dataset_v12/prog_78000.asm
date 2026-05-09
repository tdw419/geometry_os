; DESCRIPTION: Composite: Creates a purple circular shape at (391, 149) with radius 61 then Places a purple dot at position (510, 137) then Renders a green line between points (476, 234) and (275, 157).
; PLAN: r0=391(x), r1=149(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=137(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=476(x1), r11=234(y1), r12=275(x2), r13=157(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 149
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 137
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 476
LDI r11, 234
LDI r12, 275
LDI r13, 157
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
