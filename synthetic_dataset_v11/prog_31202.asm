; DESCRIPTION: Draws a red line from (110, 177) to (250, 11).
; PLAN: r0=110(x1), r1=177(y1), r2=250(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 177
LDI r2, 250
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
