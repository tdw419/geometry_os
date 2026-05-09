; DESCRIPTION: Composite: Draws a yellow line from (255, 101) to (472, 194) then Creates a black rectangular region at (415, 26) spanning 16 by 88 pixels then Sets a single red pixel at (489, 221).
; PLAN: r0=255(x1), r1=101(y1), r2=472(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=26(y), r7=16(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x), r11=221(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 101
LDI r2, 472
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 26
LDI r7, 16
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 221
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
