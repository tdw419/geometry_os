; DESCRIPTION: Draws a red line from (394, 200) to (427, 26).
; PLAN: r0=394(x1), r1=200(y1), r2=427(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 200
LDI r2, 427
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
