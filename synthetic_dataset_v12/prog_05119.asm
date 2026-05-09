; DESCRIPTION: Draws a black line from (200, 119) to (315, 175).
; PLAN: r0=200(x1), r1=119(y1), r2=315(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 119
LDI r2, 315
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
