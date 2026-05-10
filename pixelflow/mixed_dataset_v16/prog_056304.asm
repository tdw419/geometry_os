; DESCRIPTION: Draws a white line from (195, 0) to (390, 169).
; PLAN: r0=195(x1), r1=0(y1), r2=390(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 0
LDI r2, 390
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
