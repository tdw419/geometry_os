; DESCRIPTION: Renders a blue line between points (144, 217) and (309, 212).
; PLAN: r0=144(x1), r1=217(y1), r2=309(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 217
LDI r2, 309
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
