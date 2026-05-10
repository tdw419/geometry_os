; DESCRIPTION: Renders a purple line between points (431, 111) and (164, 92).
; PLAN: r0=431(x1), r1=111(y1), r2=164(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 111
LDI r2, 164
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
