; DESCRIPTION: Draws a green line from (147, 234) to (457, 14).
; PLAN: r0=147(x1), r1=234(y1), r2=457(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 234
LDI r2, 457
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
