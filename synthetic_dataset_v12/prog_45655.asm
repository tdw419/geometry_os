; DESCRIPTION: Composite: Sets a single red pixel at (451, 18) then Draws a red line from (18, 211) to (400, 142) then Draws a blue circle centered at (314, 82) with radius 56.
; PLAN: r0=451(x), r1=18(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=211(y1), r7=400(x2), r8=142(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=82(y), r12=56(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 18
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 18
LDI r6, 211
LDI r7, 400
LDI r8, 142
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 82
LDI r12, 56
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
