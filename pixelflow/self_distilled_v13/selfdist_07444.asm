; DESCRIPTION: Draws a purple line from (198, 77) to (185, 98).
; PLAN: r0=198(x1), r1=77(y1), r2=185(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 77
LDI r2, 185
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
