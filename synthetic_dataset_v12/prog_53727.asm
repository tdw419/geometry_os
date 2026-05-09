; DESCRIPTION: Composite: Places a yellow circle of radius 19 at center (75, 106) then Places a purple line segment connecting (133, 214) to (361, 81).
; PLAN: r0=75(x), r1=106(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x1), r6=214(y1), r7=361(x2), r8=81(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 106
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 214
LDI r7, 361
LDI r8, 81
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
