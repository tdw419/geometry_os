; DESCRIPTION: Composite: Creates a green rectangular region at (248, 2) spanning 58 by 104 pixels then Sets a single green pixel at (57, 117) then Draws a orange line from (327, 179) to (177, 114).
; PLAN: r0=248(x), r1=2(y), r2=58(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=117(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=327(x1), r11=179(y1), r12=177(x2), r13=114(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 2
LDI r2, 58
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 117
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 327
LDI r11, 179
LDI r12, 177
LDI r13, 114
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
