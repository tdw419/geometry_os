; DESCRIPTION: Composite: Draws a purple line from (313, 136) to (396, 142) then Creates a orange rectangular region at (242, 166) spanning 42 by 22 pixels then Sets a single purple pixel at (379, 9).
; PLAN: r0=313(x1), r1=136(y1), r2=396(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=166(y), r7=42(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=9(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 136
LDI r2, 396
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 166
LDI r7, 42
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 9
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
