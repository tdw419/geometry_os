; DESCRIPTION: Renders a purple line segment connecting (96, 7) to (38, 144).
; PLAN: r0=96(x1), r1=7(y1), r2=38(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 7
LDI r2, 38
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
