; DESCRIPTION: Composite: Creates a purple circular shape at (246, 156) with radius 49 then Places a blue dot at position (220, 179) then Draws a purple line from (444, 249) to (32, 216).
; PLAN: r0=246(x), r1=156(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=179(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=444(x1), r11=249(y1), r12=32(x2), r13=216(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 156
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 179
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 249
LDI r12, 32
LDI r13, 216
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
