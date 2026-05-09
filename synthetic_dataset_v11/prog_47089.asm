; DESCRIPTION: Places a purple line segment connecting (243, 111) to (5, 169).
; PLAN: r0=243(x1), r1=111(y1), r2=5(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 111
LDI r2, 5
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
