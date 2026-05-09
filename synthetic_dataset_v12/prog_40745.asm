; DESCRIPTION: Composite: Renders a green line between points (135, 198) and (312, 211) then Sets a single blue pixel at (420, 227).
; PLAN: r0=135(x1), r1=198(y1), r2=312(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=227(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 198
LDI r2, 312
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 227
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
