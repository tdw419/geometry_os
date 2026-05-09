; DESCRIPTION: Composite: Draws a red circle centered at (301, 201) with radius 21 then Draws a black line from (450, 158) to (163, 27) then Sets a single white pixel at (379, 175).
; PLAN: r0=301(x), r1=201(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=158(y1), r7=163(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=175(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 201
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 158
LDI r7, 163
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 175
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
