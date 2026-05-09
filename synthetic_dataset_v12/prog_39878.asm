; DESCRIPTION: Places a purple line segment connecting (449, 33) to (269, 138).
; PLAN: r0=449(x1), r1=33(y1), r2=269(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 33
LDI r2, 269
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
