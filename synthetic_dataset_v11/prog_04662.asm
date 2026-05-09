; DESCRIPTION: Renders a purple line between points (151, 105) and (28, 221).
; PLAN: r0=151(x1), r1=105(y1), r2=28(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 105
LDI r2, 28
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
