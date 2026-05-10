; DESCRIPTION: Renders a purple line segment connecting (80, 2) to (196, 68).
; PLAN: r0=80(x1), r1=2(y1), r2=196(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 2
LDI r2, 196
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
