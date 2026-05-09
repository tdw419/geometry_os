; DESCRIPTION: Draws a black line from (102, 250) to (200, 206).
; PLAN: r0=102(x1), r1=250(y1), r2=200(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 250
LDI r2, 200
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
