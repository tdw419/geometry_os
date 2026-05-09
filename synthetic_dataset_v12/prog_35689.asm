; DESCRIPTION: Composite: Draws a orange circle centered at (451, 111) with radius 31 then Renders a yellow line between points (402, 58) and (484, 181) then Places a orange dot at position (209, 169).
; PLAN: r0=451(x), r1=111(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=58(y1), r7=484(x2), r8=181(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=169(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 111
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 58
LDI r7, 484
LDI r8, 181
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 169
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
