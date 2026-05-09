; DESCRIPTION: Composite: Draws a purple line from (10, 240) to (365, 185) then Creates a orange rectangular region at (226, 54) spanning 38 by 39 pixels then Sets a single orange pixel at (439, 156).
; PLAN: r0=10(x1), r1=240(y1), r2=365(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=54(y), r7=38(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=156(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 10
LDI r1, 240
LDI r2, 365
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 54
LDI r7, 38
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 156
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
