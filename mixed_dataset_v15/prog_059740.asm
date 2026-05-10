; DESCRIPTION: Renders a purple line segment connecting (148, 44) to (277, 138).
; PLAN: r0=148(x1), r1=44(y1), r2=277(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 44
LDI r2, 277
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
