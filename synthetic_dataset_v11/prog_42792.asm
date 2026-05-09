; DESCRIPTION: Draws a red line from (177, 149) to (223, 147).
; PLAN: r0=177(x1), r1=149(y1), r2=223(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 149
LDI r2, 223
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
