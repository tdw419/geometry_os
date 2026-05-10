; DESCRIPTION: Composite: Sets a single yellow pixel at (201, 49) then Draws a blue line from (123, 144) to (200, 10).
; PLAN: r0=201(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=144(y1), r7=200(x2), r8=10(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 123
LDI r6, 144
LDI r7, 200
LDI r8, 10
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
