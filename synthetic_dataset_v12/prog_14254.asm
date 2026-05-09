; DESCRIPTION: Composite: Creates a purple circular shape at (36, 51) with radius 28 then Draws a blue line from (309, 38) to (85, 233).
; PLAN: r0=36(x), r1=51(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x1), r6=38(y1), r7=85(x2), r8=233(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 51
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 38
LDI r7, 85
LDI r8, 233
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
