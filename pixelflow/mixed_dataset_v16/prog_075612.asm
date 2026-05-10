; DESCRIPTION: Renders a blue line between points (80, 15) and (94, 56).
; PLAN: r0=80(x1), r1=15(y1), r2=94(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 15
LDI r2, 94
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
