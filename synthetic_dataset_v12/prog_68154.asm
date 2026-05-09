; DESCRIPTION: Composite: Places a yellow circle of radius 61 at center (86, 155) then Draws a magenta line from (115, 104) to (369, 97) then Sets a single green pixel at (431, 97).
; PLAN: r0=86(x), r1=155(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=104(y1), r7=369(x2), r8=97(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=431(x), r11=97(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 155
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 104
LDI r7, 369
LDI r8, 97
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 97
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
