; DESCRIPTION: Composite: Creates a magenta rectangular region at (411, 156) spanning 89 by 54 pixels then Sets a single purple pixel at (206, 177) then Draws a green line from (367, 252) to (172, 3).
; PLAN: r0=411(x), r1=156(y), r2=89(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=177(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=367(x1), r11=252(y1), r12=172(x2), r13=3(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 156
LDI r2, 89
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 177
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 367
LDI r11, 252
LDI r12, 172
LDI r13, 3
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
