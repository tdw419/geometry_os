; DESCRIPTION: Renders a purple line between points (21, 80) and (182, 196).
; PLAN: r0=21(x1), r1=80(y1), r2=182(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 80
LDI r2, 182
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
