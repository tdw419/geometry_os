; DESCRIPTION: Composite: Renders a yellow line between points (1, 79) and (319, 131) then Draws a green circle centered at (63, 123) with radius 21.
; PLAN: r0=1(x1), r1=79(y1), r2=319(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=123(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 79
LDI r2, 319
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 123
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
