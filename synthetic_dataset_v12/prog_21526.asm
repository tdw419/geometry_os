; DESCRIPTION: Composite: Places a blue line segment connecting (110, 179) to (395, 217) then Creates a yellow rectangular region at (188, 59) spanning 94 by 83 pixels then Sets a single orange pixel at (401, 205).
; PLAN: r0=110(x1), r1=179(y1), r2=395(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=59(y), r7=94(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=205(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 179
LDI r2, 395
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 59
LDI r7, 94
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 205
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
