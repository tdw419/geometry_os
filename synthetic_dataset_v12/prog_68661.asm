; DESCRIPTION: Composite: Places a green line segment connecting (27, 248) to (444, 58) then Creates a blue rectangular region at (297, 88) spanning 101 by 80 pixels then Sets a single cyan pixel at (272, 96).
; PLAN: r0=27(x1), r1=248(y1), r2=444(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=88(y), r7=101(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=96(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 27
LDI r1, 248
LDI r2, 444
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 88
LDI r7, 101
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 96
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
