; DESCRIPTION: Composite: Places a cyan line segment connecting (304, 19) to (106, 68) then Places a blue dot at position (431, 84) then Creates a yellow circular shape at (342, 147) with radius 30.
; PLAN: r0=304(x1), r1=19(y1), r2=106(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=84(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=147(y), r12=30(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 19
LDI r2, 106
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 84
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 147
LDI r12, 30
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
