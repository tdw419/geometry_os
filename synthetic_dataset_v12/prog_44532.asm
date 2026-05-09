; DESCRIPTION: Composite: Places a orange 47x81 rectangle at position (89, 156) then Renders a yellow disk with center (267, 72) and radius 49 then Places a green line segment connecting (195, 199) to (441, 230).
; PLAN: r0=89(x), r1=156(y), r2=47(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=72(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x1), r11=199(y1), r12=441(x2), r13=230(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 156
LDI r2, 47
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 72
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 199
LDI r12, 441
LDI r13, 230
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
