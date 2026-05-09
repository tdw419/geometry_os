; DESCRIPTION: Renders a purple line between points (506, 226) and (475, 152).
; PLAN: r0=506(x1), r1=226(y1), r2=475(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 226
LDI r2, 475
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
