; DESCRIPTION: Renders a blue line between points (56, 208) and (250, 190).
; PLAN: r0=56(x1), r1=208(y1), r2=250(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 208
LDI r2, 250
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
