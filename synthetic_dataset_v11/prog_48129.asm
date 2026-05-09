; DESCRIPTION: Draws a white line from (247, 188) to (147, 58).
; PLAN: r0=247(x1), r1=188(y1), r2=147(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 188
LDI r2, 147
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
