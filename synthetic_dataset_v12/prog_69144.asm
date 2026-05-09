; DESCRIPTION: Composite: Places a blue line segment connecting (122, 81) to (25, 181) then Creates a yellow circular shape at (245, 128) with radius 77 then Sets a single magenta pixel at (418, 181).
; PLAN: r0=122(x1), r1=81(y1), r2=25(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=128(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x), r11=181(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 81
LDI r2, 25
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 128
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 181
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
