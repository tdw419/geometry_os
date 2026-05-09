; DESCRIPTION: Composite: Draws a green line from (277, 66) to (40, 246) then Places a yellow circle of radius 64 at center (258, 98) then Creates a blue rectangular region at (483, 179) spanning 24 by 49 pixels.
; PLAN: r0=277(x1), r1=66(y1), r2=40(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=98(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x), r11=179(y), r12=24(width), r13=49(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 66
LDI r2, 40
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 98
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 179
LDI r12, 24
LDI r13, 49
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
