; DESCRIPTION: Renders a purple line between points (271, 248) and (99, 241).
; PLAN: r0=271(x1), r1=248(y1), r2=99(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 248
LDI r2, 99
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
