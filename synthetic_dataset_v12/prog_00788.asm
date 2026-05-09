; DESCRIPTION: Composite: Places a purple circle of radius 49 at center (192, 51) then Places a green dot at position (31, 152) then Draws a purple line from (154, 175) to (302, 79).
; PLAN: r0=192(x), r1=51(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=152(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=175(y1), r12=302(x2), r13=79(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 51
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 152
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 154
LDI r11, 175
LDI r12, 302
LDI r13, 79
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
