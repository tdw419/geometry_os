; DESCRIPTION: Composite: Sets a single red pixel at (276, 113) then Draws a white line from (149, 19) to (99, 32) then Creates a black rectangular region at (347, 97) spanning 70 by 116 pixels.
; PLAN: r0=276(x), r1=113(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=19(y1), r7=99(x2), r8=32(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=97(y), r12=70(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 113
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 149
LDI r6, 19
LDI r7, 99
LDI r8, 32
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 97
LDI r12, 70
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
