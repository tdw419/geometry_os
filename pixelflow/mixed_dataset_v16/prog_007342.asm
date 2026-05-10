; DESCRIPTION: Renders a blue line segment connecting (251, 179) to (96, 76).
; PLAN: r0=251(x1), r1=179(y1), r2=96(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 179
LDI r2, 96
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
