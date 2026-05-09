; DESCRIPTION: Renders a blue line between points (331, 17) and (196, 97).
; PLAN: r0=331(x1), r1=17(y1), r2=196(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 17
LDI r2, 196
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
