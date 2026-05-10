; DESCRIPTION: Draws a blue line from (363, 117) to (475, 181).
; PLAN: r0=363(x1), r1=117(y1), r2=475(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 117
LDI r2, 475
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
