; DESCRIPTION: Composite: Places a green line segment connecting (384, 86) to (269, 31) then Sets a single cyan pixel at (129, 150) then Draws a purple circle centered at (142, 182) with radius 72.
; PLAN: r0=384(x1), r1=86(y1), r2=269(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=150(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=182(y), r12=72(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 86
LDI r2, 269
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 150
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 142
LDI r11, 182
LDI r12, 72
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
