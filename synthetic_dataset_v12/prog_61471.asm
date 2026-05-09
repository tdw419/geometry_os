; DESCRIPTION: Places a yellow line segment connecting (263, 223) to (151, 216).
; PLAN: r0=263(x1), r1=223(y1), r2=151(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 223
LDI r2, 151
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
