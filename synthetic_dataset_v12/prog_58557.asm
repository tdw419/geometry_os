; DESCRIPTION: Renders a purple line between points (330, 80) and (373, 46).
; PLAN: r0=330(x1), r1=80(y1), r2=373(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 80
LDI r2, 373
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
