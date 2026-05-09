; DESCRIPTION: Renders a purple line between points (70, 95) and (91, 211).
; PLAN: r0=70(x1), r1=95(y1), r2=91(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 95
LDI r2, 91
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
