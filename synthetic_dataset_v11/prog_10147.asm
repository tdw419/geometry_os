; DESCRIPTION: Renders a purple line between points (72, 188) and (205, 193).
; PLAN: r0=72(x1), r1=188(y1), r2=205(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 188
LDI r2, 205
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
