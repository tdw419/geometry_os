; DESCRIPTION: Composite: Renders a orange line between points (451, 124) and (314, 234) then Places a blue dot at position (222, 63) then Draws a yellow circle centered at (224, 95) with radius 56.
; PLAN: r0=451(x1), r1=124(y1), r2=314(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=63(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=224(x), r11=95(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 124
LDI r2, 314
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 63
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 224
LDI r11, 95
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
