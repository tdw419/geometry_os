; DESCRIPTION: Composite: Draws a yellow circle centered at (195, 118) with radius 58 then Places a cyan line segment connecting (148, 204) to (57, 70) then Places a purple 22x91 rectangle at position (137, 122).
; PLAN: r0=195(x), r1=118(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=204(y1), r7=57(x2), r8=70(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=122(y), r12=22(width), r13=91(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 118
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 204
LDI r7, 57
LDI r8, 70
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 122
LDI r12, 22
LDI r13, 91
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
