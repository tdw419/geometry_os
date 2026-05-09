; DESCRIPTION: Renders a purple line between points (59, 112) and (196, 199).
; PLAN: r0=59(x1), r1=112(y1), r2=196(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 112
LDI r2, 196
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
