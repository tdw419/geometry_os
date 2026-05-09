; DESCRIPTION: Draws a black line from (296, 177) to (510, 201).
; PLAN: r0=296(x1), r1=177(y1), r2=510(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 177
LDI r2, 510
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
