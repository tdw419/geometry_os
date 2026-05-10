; DESCRIPTION: Draws a white line from (448, 89) to (195, 160).
; PLAN: r0=448(x1), r1=89(y1), r2=195(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 89
LDI r2, 195
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
