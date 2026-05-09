; DESCRIPTION: Renders a purple line between points (39, 174) and (181, 207).
; PLAN: r0=39(x1), r1=174(y1), r2=181(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 174
LDI r2, 181
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
