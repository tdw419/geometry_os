; DESCRIPTION: Composite: Sets a single orange pixel at (307, 208) then Places a yellow line segment connecting (433, 65) to (23, 114) then Places a purple circle of radius 54 at center (195, 110).
; PLAN: r0=307(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=65(y1), r7=23(x2), r8=114(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=195(x), r11=110(y), r12=54(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 433
LDI r6, 65
LDI r7, 23
LDI r8, 114
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 110
LDI r12, 54
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
