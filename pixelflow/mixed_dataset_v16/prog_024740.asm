; DESCRIPTION: Places a purple line segment connecting (98, 223) to (52, 149).
; PLAN: r0=98(x1), r1=223(y1), r2=52(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 223
LDI r2, 52
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
