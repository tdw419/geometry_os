; DESCRIPTION: Draws a white line from (155, 124) to (190, 17).
; PLAN: r0=155(x1), r1=124(y1), r2=190(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 124
LDI r2, 190
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
