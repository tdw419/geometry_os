; DESCRIPTION: Renders a purple line between points (385, 225) and (252, 234).
; PLAN: r0=385(x1), r1=225(y1), r2=252(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 225
LDI r2, 252
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
