; DESCRIPTION: Renders a blue line between points (493, 118) and (199, 199).
; PLAN: r0=493(x1), r1=118(y1), r2=199(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 118
LDI r2, 199
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
