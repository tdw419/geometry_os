; DESCRIPTION: Places a blue line segment connecting (126, 51) to (227, 17).
; PLAN: r0=126(x1), r1=51(y1), r2=227(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 51
LDI r2, 227
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
