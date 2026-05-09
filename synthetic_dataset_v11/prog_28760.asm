; DESCRIPTION: Renders a blue line between points (131, 40) and (143, 22).
; PLAN: r0=131(x1), r1=40(y1), r2=143(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 40
LDI r2, 143
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
