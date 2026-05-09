; DESCRIPTION: Draws a green line from (189, 174) to (207, 147).
; PLAN: r0=189(x1), r1=174(y1), r2=207(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 174
LDI r2, 207
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
