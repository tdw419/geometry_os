; DESCRIPTION: Renders a purple line between points (54, 103) and (293, 133).
; PLAN: r0=54(x1), r1=103(y1), r2=293(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 103
LDI r2, 293
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
