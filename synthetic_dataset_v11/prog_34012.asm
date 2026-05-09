; DESCRIPTION: Draws a white line from (170, 229) to (11, 245).
; PLAN: r0=170(x1), r1=229(y1), r2=11(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 229
LDI r2, 11
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
