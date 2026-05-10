; DESCRIPTION: Renders a purple line between points (125, 248) and (209, 218).
; PLAN: r0=125(x1), r1=248(y1), r2=209(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 248
LDI r2, 209
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
