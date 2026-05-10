; DESCRIPTION: Places a yellow line segment connecting (161, 195) to (357, 238).
; PLAN: r0=161(x1), r1=195(y1), r2=357(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 195
LDI r2, 357
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
