; DESCRIPTION: Composite: Creates a black rectangular region at (289, 73) spanning 111 by 73 pixels then Sets a single red pixel at (305, 151) then Draws a white line from (117, 185) to (97, 37).
; PLAN: r0=289(x), r1=73(y), r2=111(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=151(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=117(x1), r11=185(y1), r12=97(x2), r13=37(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 73
LDI r2, 111
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 151
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 117
LDI r11, 185
LDI r12, 97
LDI r13, 37
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
