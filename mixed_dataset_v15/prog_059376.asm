; DESCRIPTION: Composite: Draws a orange circle centered at (354, 205) with radius 45 then Sets a single blue pixel at (357, 189) then Renders a purple line between points (168, 39) and (431, 84).
; PLAN: r0=354(x), r1=205(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=189(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=39(y1), r12=431(x2), r13=84(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 205
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 189
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 39
LDI r12, 431
LDI r13, 84
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
