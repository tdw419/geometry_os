; DESCRIPTION: Renders a blue line between points (108, 240) and (201, 249).
; PLAN: r0=108(x1), r1=240(y1), r2=201(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 240
LDI r2, 201
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
