; DESCRIPTION: Composite: Draws a blue line from (165, 56) to (428, 200) then Creates a yellow rectangular region at (259, 22) spanning 81 by 74 pixels then Sets a single purple pixel at (158, 236).
; PLAN: r0=165(x1), r1=56(y1), r2=428(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=22(y), r7=81(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=236(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 56
LDI r2, 428
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 22
LDI r7, 81
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 236
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
