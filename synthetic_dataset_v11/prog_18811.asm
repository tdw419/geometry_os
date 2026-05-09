; DESCRIPTION: Draws a black line from (147, 236) to (168, 201).
; PLAN: r0=147(x1), r1=236(y1), r2=168(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 236
LDI r2, 168
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
