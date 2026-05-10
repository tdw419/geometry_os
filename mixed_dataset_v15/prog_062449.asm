; DESCRIPTION: Composite: Draws a black line from (60, 214) to (56, 131) then Creates a red rectangular region at (301, 60) spanning 63 by 100 pixels then Sets a single orange pixel at (296, 188).
; PLAN: r0=60(x1), r1=214(y1), r2=56(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=60(y), r7=63(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=188(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 214
LDI r2, 56
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 60
LDI r7, 63
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 188
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
