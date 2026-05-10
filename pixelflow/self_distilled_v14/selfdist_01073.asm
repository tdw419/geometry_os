; DESCRIPTION: Renders a purple line segment connecting (352, 4) to (395, 47).
; PLAN: r0=352(x1), r1=4(y1), r2=395(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 4
LDI r2, 395
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
