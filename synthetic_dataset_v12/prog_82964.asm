; DESCRIPTION: Renders a blue line between points (19, 78) and (508, 220).
; PLAN: r0=19(x1), r1=78(y1), r2=508(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 78
LDI r2, 508
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
