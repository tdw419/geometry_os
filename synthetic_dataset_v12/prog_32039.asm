; DESCRIPTION: Composite: Draws a cyan line from (195, 146) to (77, 102) then Sets a single cyan pixel at (221, 157) then Creates a magenta circular shape at (68, 110) with radius 38.
; PLAN: r0=195(x1), r1=146(y1), r2=77(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=110(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 146
LDI r2, 77
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 68
LDI r11, 110
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
