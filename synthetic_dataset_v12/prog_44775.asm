; DESCRIPTION: Renders a blue line between points (19, 24) and (423, 132).
; PLAN: r0=19(x1), r1=24(y1), r2=423(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 24
LDI r2, 423
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
