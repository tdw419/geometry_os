; DESCRIPTION: Renders a purple line between points (293, 91) and (403, 3).
; PLAN: r0=293(x1), r1=91(y1), r2=403(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 91
LDI r2, 403
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
