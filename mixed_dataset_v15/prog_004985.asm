; DESCRIPTION: Draws a red line from (125, 94) to (201, 132).
; PLAN: r0=125(x1), r1=94(y1), r2=201(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 94
LDI r2, 201
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
