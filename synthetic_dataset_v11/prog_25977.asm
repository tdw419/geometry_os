; DESCRIPTION: Draws a green line from (94, 183) to (229, 145).
; PLAN: r0=94(x1), r1=183(y1), r2=229(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 183
LDI r2, 229
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
