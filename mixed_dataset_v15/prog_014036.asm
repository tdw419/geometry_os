; DESCRIPTION: Draws a green line from (353, 115) to (454, 169).
; PLAN: r0=353(x1), r1=115(y1), r2=454(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 115
LDI r2, 454
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
