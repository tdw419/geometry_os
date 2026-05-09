; DESCRIPTION: Composite: Draws a red circle centered at (84, 67) with radius 54 then Draws a cyan line from (314, 45) to (437, 252) then Sets a single orange pixel at (476, 211).
; PLAN: r0=84(x), r1=67(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=45(y1), r7=437(x2), r8=252(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=211(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 67
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 45
LDI r7, 437
LDI r8, 252
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 211
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
