; DESCRIPTION: Draws a yellow line from (227, 236) to (211, 89).
; PLAN: r0=227(x1), r1=236(y1), r2=211(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 236
LDI r2, 211
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
