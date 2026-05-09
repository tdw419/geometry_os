; DESCRIPTION: Renders a blue line between points (151, 237) and (36, 47).
; PLAN: r0=151(x1), r1=237(y1), r2=36(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 237
LDI r2, 36
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
