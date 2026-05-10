; DESCRIPTION: Renders a blue line between points (471, 56) and (23, 206).
; PLAN: r0=471(x1), r1=56(y1), r2=23(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 56
LDI r2, 23
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
