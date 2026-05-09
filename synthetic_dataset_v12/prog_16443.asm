; DESCRIPTION: Draws a red line from (56, 249) to (390, 72).
; PLAN: r0=56(x1), r1=249(y1), r2=390(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 249
LDI r2, 390
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
