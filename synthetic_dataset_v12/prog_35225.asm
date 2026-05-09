; DESCRIPTION: Draws a blue line from (107, 54) to (478, 84).
; PLAN: r0=107(x1), r1=54(y1), r2=478(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 54
LDI r2, 478
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
