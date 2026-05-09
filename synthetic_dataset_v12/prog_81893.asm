; DESCRIPTION: Composite: Places a orange circle of radius 22 at center (309, 156) then Places a purple dot at position (99, 144) then Renders a magenta line between points (326, 255) and (471, 138).
; PLAN: r0=309(x), r1=156(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=144(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=326(x1), r11=255(y1), r12=471(x2), r13=138(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 156
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 144
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 326
LDI r11, 255
LDI r12, 471
LDI r13, 138
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
