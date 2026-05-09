; DESCRIPTION: Draws a white line from (99, 147) to (419, 252).
; PLAN: r0=99(x1), r1=147(y1), r2=419(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 147
LDI r2, 419
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
