; DESCRIPTION: Renders a blue line between points (315, 45) and (357, 220).
; PLAN: r0=315(x1), r1=45(y1), r2=357(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 45
LDI r2, 357
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
