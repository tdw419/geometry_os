; DESCRIPTION: Draws a red line from (468, 137) to (273, 159).
; PLAN: r0=468(x1), r1=137(y1), r2=273(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 137
LDI r2, 273
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
