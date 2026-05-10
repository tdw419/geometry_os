; DESCRIPTION: Renders a blue line segment connecting (66, 95) to (190, 51).
; PLAN: r0=66(x1), r1=95(y1), r2=190(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 95
LDI r2, 190
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
