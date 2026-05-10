; DESCRIPTION: Draws a purple line from (77, 77) to (120, 225).
; PLAN: r0=77(x1), r1=77(y1), r2=120(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 77
LDI r2, 120
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
