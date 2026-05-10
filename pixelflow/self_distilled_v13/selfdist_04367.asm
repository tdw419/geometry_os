; DESCRIPTION: Renders a purple line segment connecting (395, 9) to (219, 21).
; PLAN: r0=395(x1), r1=9(y1), r2=219(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 9
LDI r2, 219
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
