; DESCRIPTION: Draws a white line from (4, 229) to (145, 245).
; PLAN: r0=4(x1), r1=229(y1), r2=145(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 229
LDI r2, 145
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
