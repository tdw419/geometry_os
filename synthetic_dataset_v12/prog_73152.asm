; DESCRIPTION: Composite: Places a purple circle of radius 26 at center (476, 225) then Places a black dot at position (38, 10) then Draws a green line from (206, 45) to (259, 175).
; PLAN: r0=476(x), r1=225(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=10(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=206(x1), r11=45(y1), r12=259(x2), r13=175(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 225
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 10
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 206
LDI r11, 45
LDI r12, 259
LDI r13, 175
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
