; DESCRIPTION: Composite: Creates a cyan rectangular region at (144, 148) spanning 94 by 13 pixels then Sets a single red pixel at (492, 183) then Draws a cyan line from (315, 161) to (321, 235).
; PLAN: r0=144(x), r1=148(y), r2=94(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=183(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=315(x1), r11=161(y1), r12=321(x2), r13=235(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 148
LDI r2, 94
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 183
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 315
LDI r11, 161
LDI r12, 321
LDI r13, 235
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
