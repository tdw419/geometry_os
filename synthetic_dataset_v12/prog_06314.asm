; DESCRIPTION: Draws a blue line from (203, 119) to (33, 82).
; PLAN: r0=203(x1), r1=119(y1), r2=33(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 119
LDI r2, 33
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
