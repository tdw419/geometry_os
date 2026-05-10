; DESCRIPTION: Composite: Places a yellow line segment connecting (152, 192) to (436, 191) then Creates a cyan rectangular region at (424, 19) spanning 78 by 107 pixels then Sets a single blue pixel at (15, 178).
; PLAN: r0=152(x1), r1=192(y1), r2=436(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=19(y), r7=78(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=15(x), r11=178(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 192
LDI r2, 436
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 19
LDI r7, 78
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 15
LDI r11, 178
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
