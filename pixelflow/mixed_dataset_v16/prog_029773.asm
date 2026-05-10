; DESCRIPTION: Draws a green line from (444, 121) to (323, 124).
; PLAN: r0=444(x1), r1=121(y1), r2=323(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 121
LDI r2, 323
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
