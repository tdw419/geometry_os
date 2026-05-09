; DESCRIPTION: Draws a yellow line from (402, 142) to (323, 248).
; PLAN: r0=402(x1), r1=142(y1), r2=323(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 142
LDI r2, 323
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
