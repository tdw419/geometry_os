; DESCRIPTION: Composite: Places a cyan line segment connecting (405, 30) to (58, 169) then Sets a single magenta pixel at (364, 249) then Creates a green rectangular region at (110, 78) spanning 116 by 19 pixels.
; PLAN: r0=405(x1), r1=30(y1), r2=58(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=249(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=78(y), r12=116(width), r13=19(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 30
LDI r2, 58
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 249
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 78
LDI r12, 116
LDI r13, 19
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
