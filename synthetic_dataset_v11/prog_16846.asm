; DESCRIPTION: Renders a purple line between points (127, 244) and (111, 89).
; PLAN: r0=127(x1), r1=244(y1), r2=111(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 244
LDI r2, 111
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
