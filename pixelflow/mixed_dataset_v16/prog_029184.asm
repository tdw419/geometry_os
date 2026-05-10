; DESCRIPTION: Composite: Sets a single magenta pixel at (95, 149) then Creates a cyan rectangular region at (351, 126) spanning 79 by 91 pixels then Draws a purple line from (95, 84) to (248, 41).
; PLAN: r0=95(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=126(y), r7=79(width), r8=91(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x1), r11=84(y1), r12=248(x2), r13=41(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 126
LDI r7, 79
LDI r8, 91
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 84
LDI r12, 248
LDI r13, 41
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
