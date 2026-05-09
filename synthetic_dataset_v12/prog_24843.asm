; DESCRIPTION: Places a yellow line segment connecting (314, 168) to (113, 216).
; PLAN: r0=314(x1), r1=168(y1), r2=113(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 168
LDI r2, 113
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
