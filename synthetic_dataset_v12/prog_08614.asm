; DESCRIPTION: Renders a blue line between points (279, 157) and (112, 72).
; PLAN: r0=279(x1), r1=157(y1), r2=112(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 157
LDI r2, 112
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
