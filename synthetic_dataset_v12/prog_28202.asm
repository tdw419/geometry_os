; DESCRIPTION: Draws a white line from (448, 83) to (358, 66).
; PLAN: r0=448(x1), r1=83(y1), r2=358(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 83
LDI r2, 358
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
