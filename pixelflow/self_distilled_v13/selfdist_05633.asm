; DESCRIPTION: Renders a blue line segment connecting (128, 47) to (94, 77).
; PLAN: r0=128(x1), r1=47(y1), r2=94(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 47
LDI r2, 94
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
