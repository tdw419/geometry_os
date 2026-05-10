; DESCRIPTION: Places a purple line segment connecting (388, 140) to (45, 27).
; PLAN: r0=388(x1), r1=140(y1), r2=45(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 140
LDI r2, 45
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
