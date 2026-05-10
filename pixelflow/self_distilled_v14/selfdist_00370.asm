; DESCRIPTION: Renders a purple line segment connecting (317, 127) to (363, 71).
; PLAN: r0=317(x1), r1=127(y1), r2=363(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 127
LDI r2, 363
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
