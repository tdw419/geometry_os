; DESCRIPTION: Composite: Draws a black line from (189, 236) to (40, 238) then Creates a cyan rectangular region at (162, 127) spanning 85 by 112 pixels then Sets a single yellow pixel at (208, 164).
; PLAN: r0=189(x1), r1=236(y1), r2=40(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=127(y), r7=85(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=164(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 236
LDI r2, 40
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 127
LDI r7, 85
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 164
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
