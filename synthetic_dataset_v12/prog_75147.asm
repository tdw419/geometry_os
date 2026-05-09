; DESCRIPTION: Draws a blue line from (185, 56) to (82, 35).
; PLAN: r0=185(x1), r1=56(y1), r2=82(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 56
LDI r2, 82
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
