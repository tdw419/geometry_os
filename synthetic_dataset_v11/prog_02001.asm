; DESCRIPTION: Renders a purple line between points (123, 87) and (195, 153).
; PLAN: r0=123(x1), r1=87(y1), r2=195(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 87
LDI r2, 195
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
