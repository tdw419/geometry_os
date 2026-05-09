; DESCRIPTION: Composite: Places a purple line segment connecting (476, 188) to (178, 207) then Draws a purple rectangle at (141, 10) with width 36 and height 106 then Sets a single black pixel at (451, 96).
; PLAN: r0=476(x1), r1=188(y1), r2=178(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=10(y), r7=36(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=96(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 476
LDI r1, 188
LDI r2, 178
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 10
LDI r7, 36
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 96
LDI r12, 0x000000
PSET r10, r11, r12
HALT
