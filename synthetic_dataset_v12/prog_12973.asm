; DESCRIPTION: Composite: Creates a red rectangular region at (259, 119) spanning 45 by 79 pixels then Sets a single orange pixel at (329, 249) then Draws a yellow line from (351, 204) to (81, 156).
; PLAN: r0=259(x), r1=119(y), r2=45(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=249(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=351(x1), r11=204(y1), r12=81(x2), r13=156(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 119
LDI r2, 45
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 249
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 351
LDI r11, 204
LDI r12, 81
LDI r13, 156
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
