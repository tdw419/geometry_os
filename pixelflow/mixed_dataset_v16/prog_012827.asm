; DESCRIPTION: Renders a purple line between points (223, 65) and (73, 244).
; PLAN: r0=223(x1), r1=65(y1), r2=73(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 65
LDI r2, 73
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
