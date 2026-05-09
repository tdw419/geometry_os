; DESCRIPTION: Composite: Places a yellow line segment connecting (386, 215) to (376, 134) then Creates a blue rectangular region at (60, 137) spanning 80 by 83 pixels then Sets a single orange pixel at (259, 118).
; PLAN: r0=386(x1), r1=215(y1), r2=376(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=137(y), r7=80(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=118(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 215
LDI r2, 376
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 137
LDI r7, 80
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 118
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
