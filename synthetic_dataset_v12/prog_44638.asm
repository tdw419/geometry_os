; DESCRIPTION: Places a blue line segment connecting (126, 254) to (322, 138).
; PLAN: r0=126(x1), r1=254(y1), r2=322(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 254
LDI r2, 322
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
