; DESCRIPTION: Draws a white line from (155, 185) to (57, 94).
; PLAN: r0=155(x1), r1=185(y1), r2=57(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 185
LDI r2, 57
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
