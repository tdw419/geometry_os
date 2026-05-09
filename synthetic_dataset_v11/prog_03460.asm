; DESCRIPTION: Renders a purple line between points (28, 0) and (129, 236).
; PLAN: r0=28(x1), r1=0(y1), r2=129(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 0
LDI r2, 129
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
