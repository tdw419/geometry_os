; DESCRIPTION: Renders a blue line between points (293, 65) and (490, 249).
; PLAN: r0=293(x1), r1=65(y1), r2=490(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 65
LDI r2, 490
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
