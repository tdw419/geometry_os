; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (329, 169) then Places a green dot at position (87, 49) then Draws a green line from (482, 253) to (231, 110).
; PLAN: r0=329(x), r1=169(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=49(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=482(x1), r11=253(y1), r12=231(x2), r13=110(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 169
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 49
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 482
LDI r11, 253
LDI r12, 231
LDI r13, 110
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
