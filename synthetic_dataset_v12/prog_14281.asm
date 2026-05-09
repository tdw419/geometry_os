; DESCRIPTION: Composite: Creates a purple circular shape at (326, 133) with radius 52 then Draws a black line from (212, 101) to (56, 26).
; PLAN: r0=326(x), r1=133(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x1), r6=101(y1), r7=56(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 133
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 101
LDI r7, 56
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
