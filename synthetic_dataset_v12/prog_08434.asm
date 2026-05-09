; DESCRIPTION: Composite: Sets a single black pixel at (322, 198) then Creates a orange rectangular region at (317, 128) spanning 108 by 69 pixels then Draws a green line from (176, 113) to (427, 133).
; PLAN: r0=322(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=128(y), r7=108(width), r8=69(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x1), r11=113(y1), r12=427(x2), r13=133(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 198
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 128
LDI r7, 108
LDI r8, 69
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 113
LDI r12, 427
LDI r13, 133
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
