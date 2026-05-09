; DESCRIPTION: Composite: Places a black dot at position (319, 97) then Creates a purple circular shape at (114, 132) with radius 63 then Places a orange line segment connecting (209, 165) to (201, 74).
; PLAN: r0=319(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=132(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x1), r11=165(y1), r12=201(x2), r13=74(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 114
LDI r6, 132
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 165
LDI r12, 201
LDI r13, 74
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
