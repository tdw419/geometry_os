; DESCRIPTION: Composite: Places a yellow dot at position (270, 199) then Draws a orange line from (318, 25) to (32, 186) then Places a black circle of radius 13 at center (107, 189).
; PLAN: r0=270(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=318(x1), r6=25(y1), r7=32(x2), r8=186(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=189(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 318
LDI r6, 25
LDI r7, 32
LDI r8, 186
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 189
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
