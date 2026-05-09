; DESCRIPTION: Composite: Draws a black line from (319, 63) to (59, 48) then Creates a yellow circular shape at (110, 89) with radius 79.
; PLAN: r0=319(x1), r1=63(y1), r2=59(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=89(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 63
LDI r2, 59
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 89
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
