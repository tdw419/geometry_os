; DESCRIPTION: Composite: Creates a green rectangular region at (308, 109) spanning 38 by 64 pixels then Draws a magenta line from (406, 161) to (174, 51) then Sets a single green pixel at (427, 99).
; PLAN: r0=308(x), r1=109(y), r2=38(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=161(y1), r7=174(x2), r8=51(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=99(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 109
LDI r2, 38
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 161
LDI r7, 174
LDI r8, 51
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 99
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
