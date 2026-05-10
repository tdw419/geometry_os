; DESCRIPTION: Composite: Places a yellow circle of radius 22 at center (292, 44) then Draws a yellow line from (446, 193) to (427, 131) then Sets a single orange pixel at (378, 153).
; PLAN: r0=292(x), r1=44(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x1), r6=193(y1), r7=427(x2), r8=131(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=153(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 44
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 193
LDI r7, 427
LDI r8, 131
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 153
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
