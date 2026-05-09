; DESCRIPTION: Renders a blue line between points (431, 61) and (391, 157).
; PLAN: r0=431(x1), r1=61(y1), r2=391(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 61
LDI r2, 391
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
