; DESCRIPTION: Composite: Places a yellow line segment connecting (100, 71) to (191, 28) then Creates a blue rectangular region at (418, 155) spanning 38 by 98 pixels then Sets a single yellow pixel at (97, 23).
; PLAN: r0=100(x1), r1=71(y1), r2=191(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=155(y), r7=38(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=23(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 71
LDI r2, 191
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 155
LDI r7, 38
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 23
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
