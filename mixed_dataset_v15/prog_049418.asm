; DESCRIPTION: Draws a black line from (448, 218) to (429, 33).
; PLAN: r0=448(x1), r1=218(y1), r2=429(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 218
LDI r2, 429
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
