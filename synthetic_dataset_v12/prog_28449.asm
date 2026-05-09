; DESCRIPTION: Places a yellow line segment connecting (471, 53) to (191, 225).
; PLAN: r0=471(x1), r1=53(y1), r2=191(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 53
LDI r2, 191
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
