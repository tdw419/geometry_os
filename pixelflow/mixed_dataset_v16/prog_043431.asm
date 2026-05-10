; DESCRIPTION: Composite: Sets a single white pixel at (251, 155) then Draws a red line from (323, 19) to (18, 102) then Draws a cyan circle centered at (265, 163) with radius 40.
; PLAN: r0=251(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=19(y1), r7=18(x2), r8=102(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=163(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 19
LDI r7, 18
LDI r8, 102
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 163
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
