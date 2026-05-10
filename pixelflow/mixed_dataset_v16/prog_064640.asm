; DESCRIPTION: Renders a yellow line between points (287, 56) and (431, 30).
; PLAN: r0=287(x1), r1=56(y1), r2=431(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 56
LDI r2, 431
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
