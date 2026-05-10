; DESCRIPTION: Composite: Places a magenta circle of radius 33 at center (43, 198) then Places a orange line segment connecting (200, 147) to (13, 136).
; PLAN: r0=43(x), r1=198(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=147(y1), r7=13(x2), r8=136(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 198
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 147
LDI r7, 13
LDI r8, 136
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
