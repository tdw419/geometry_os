; DESCRIPTION: Draws a white line from (448, 69) to (315, 145).
; PLAN: r0=448(x1), r1=69(y1), r2=315(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 69
LDI r2, 315
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
