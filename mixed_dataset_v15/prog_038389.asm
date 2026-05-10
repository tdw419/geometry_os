; DESCRIPTION: Draws a blue line from (324, 119) to (103, 76).
; PLAN: r0=324(x1), r1=119(y1), r2=103(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 119
LDI r2, 103
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
