; DESCRIPTION: Composite: Draws a orange circle centered at (450, 86) with radius 38 then Draws a red line from (314, 210) to (351, 53) then Sets a single orange pixel at (308, 46).
; PLAN: r0=450(x), r1=86(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=210(y1), r7=351(x2), r8=53(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=46(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 86
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 210
LDI r7, 351
LDI r8, 53
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 46
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
