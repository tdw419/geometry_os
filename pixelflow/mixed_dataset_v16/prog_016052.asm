; DESCRIPTION: Composite: Renders a orange line between points (325, 104) and (133, 253) then Draws a yellow circle centered at (247, 220) with radius 24.
; PLAN: r0=325(x1), r1=104(y1), r2=133(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=220(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 104
LDI r2, 133
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 220
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
