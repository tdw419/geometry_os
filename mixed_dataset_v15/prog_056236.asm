; DESCRIPTION: Composite: Draws a blue line from (381, 17) to (156, 250) then Draws a yellow circle centered at (465, 200) with radius 47.
; PLAN: r0=381(x1), r1=17(y1), r2=156(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=200(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 381
LDI r1, 17
LDI r2, 156
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 200
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
