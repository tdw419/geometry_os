; DESCRIPTION: Draws a yellow line from (147, 44) to (208, 66).
; PLAN: r0=147(x1), r1=44(y1), r2=208(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 44
LDI r2, 208
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
