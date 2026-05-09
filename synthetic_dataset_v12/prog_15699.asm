; DESCRIPTION: Composite: Creates a magenta rectangular region at (348, 47) spanning 105 by 91 pixels then Draws a red line from (127, 132) to (272, 60) then Sets a single orange pixel at (242, 62).
; PLAN: r0=348(x), r1=47(y), r2=105(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x1), r6=132(y1), r7=272(x2), r8=60(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=62(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 47
LDI r2, 105
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 132
LDI r7, 272
LDI r8, 60
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 62
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
