; DESCRIPTION: Draws a blue line from (322, 90) to (251, 23).
; PLAN: r0=322(x1), r1=90(y1), r2=251(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 90
LDI r2, 251
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
