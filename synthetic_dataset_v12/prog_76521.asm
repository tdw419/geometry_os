; DESCRIPTION: Renders a blue line between points (508, 193) and (165, 13).
; PLAN: r0=508(x1), r1=193(y1), r2=165(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 193
LDI r2, 165
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
