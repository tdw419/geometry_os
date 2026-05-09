; DESCRIPTION: Renders a purple line between points (349, 217) and (371, 103).
; PLAN: r0=349(x1), r1=217(y1), r2=371(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 217
LDI r2, 371
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
