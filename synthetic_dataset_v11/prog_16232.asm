; DESCRIPTION: Renders a purple line between points (229, 231) and (119, 122).
; PLAN: r0=229(x1), r1=231(y1), r2=119(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 231
LDI r2, 119
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
