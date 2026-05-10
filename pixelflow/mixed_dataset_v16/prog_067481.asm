; DESCRIPTION: Composite: Places a purple line segment connecting (328, 191) to (444, 238) then Creates a green rectangular region at (401, 158) spanning 33 by 67 pixels then Sets a single black pixel at (97, 166).
; PLAN: r0=328(x1), r1=191(y1), r2=444(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=158(y), r7=33(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=166(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 191
LDI r2, 444
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 158
LDI r7, 33
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 166
LDI r12, 0x000000
PSET r10, r11, r12
HALT
