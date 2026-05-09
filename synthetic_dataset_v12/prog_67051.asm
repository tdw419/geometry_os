; DESCRIPTION: Composite: Creates a purple circular shape at (214, 143) with radius 64 then Draws a black line from (390, 51) to (218, 9).
; PLAN: r0=214(x), r1=143(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x1), r6=51(y1), r7=218(x2), r8=9(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 143
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 51
LDI r7, 218
LDI r8, 9
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
