; DESCRIPTION: Renders a purple line between points (244, 180) and (125, 188).
; PLAN: r0=244(x1), r1=180(y1), r2=125(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 180
LDI r2, 125
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
