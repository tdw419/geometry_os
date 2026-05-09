; DESCRIPTION: Draws a red line from (245, 250) to (137, 26).
; PLAN: r0=245(x1), r1=250(y1), r2=137(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 250
LDI r2, 137
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
