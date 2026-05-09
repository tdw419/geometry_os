; DESCRIPTION: Places a blue line segment connecting (159, 23) to (124, 126).
; PLAN: r0=159(x1), r1=23(y1), r2=124(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 23
LDI r2, 124
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
