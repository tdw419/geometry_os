; DESCRIPTION: Renders a purple line between points (118, 205) and (151, 105).
; PLAN: r0=118(x1), r1=205(y1), r2=151(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 205
LDI r2, 151
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
