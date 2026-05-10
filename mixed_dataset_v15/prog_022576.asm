; DESCRIPTION: Composite: Creates a green circular shape at (312, 131) with radius 31 then Draws a red line from (301, 118) to (56, 57) then Sets a single orange pixel at (188, 27).
; PLAN: r0=312(x), r1=131(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=118(y1), r7=56(x2), r8=57(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=27(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 131
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 118
LDI r7, 56
LDI r8, 57
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 27
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
