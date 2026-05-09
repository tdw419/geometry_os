; DESCRIPTION: Draws a blue line from (478, 90) to (124, 64).
; PLAN: r0=478(x1), r1=90(y1), r2=124(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 90
LDI r2, 124
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
