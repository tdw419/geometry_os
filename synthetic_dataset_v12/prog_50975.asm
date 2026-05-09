; DESCRIPTION: Composite: Creates a black circular shape at (195, 205) with radius 31 then Places a magenta dot at position (391, 47) then Renders a magenta line between points (457, 198) and (56, 200).
; PLAN: r0=195(x), r1=205(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=47(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=457(x1), r11=198(y1), r12=56(x2), r13=200(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 205
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 47
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 457
LDI r11, 198
LDI r12, 56
LDI r13, 200
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
