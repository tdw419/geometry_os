; DESCRIPTION: Renders a blue line between points (136, 109) and (99, 196).
; PLAN: r0=136(x1), r1=109(y1), r2=99(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 109
LDI r2, 99
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
