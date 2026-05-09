; DESCRIPTION: Composite: Sets a single white pixel at (427, 146) then Draws a blue line from (459, 48) to (395, 201) then Places a purple 63x75 rectangle at position (418, 163).
; PLAN: r0=427(x), r1=146(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=48(y1), r7=395(x2), r8=201(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=163(y), r12=63(width), r13=75(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 146
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 459
LDI r6, 48
LDI r7, 395
LDI r8, 201
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 163
LDI r12, 63
LDI r13, 75
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
