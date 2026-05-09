; DESCRIPTION: Draws a blue line from (186, 227) to (465, 250).
; PLAN: r0=186(x1), r1=227(y1), r2=465(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 227
LDI r2, 465
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
