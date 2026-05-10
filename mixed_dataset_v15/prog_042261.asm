; DESCRIPTION: Composite: Draws a red line from (49, 238) to (428, 190) then Creates a white rectangular region at (253, 87) spanning 87 by 118 pixels then Places a green dot at position (360, 13).
; PLAN: r0=49(x1), r1=238(y1), r2=428(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=87(y), r7=87(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=13(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 238
LDI r2, 428
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 87
LDI r7, 87
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 13
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
