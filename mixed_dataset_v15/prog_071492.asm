; DESCRIPTION: Composite: Places a orange dot at position (333, 65) then Draws a red line from (314, 133) to (188, 247) then Draws a red circle centered at (276, 115) with radius 39.
; PLAN: r0=333(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=133(y1), r7=188(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=115(y), r12=39(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 314
LDI r6, 133
LDI r7, 188
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 115
LDI r12, 39
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
