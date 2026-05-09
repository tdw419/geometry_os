; DESCRIPTION: Places a green line segment connecting (124, 95) to (161, 34).
; PLAN: r0=124(x1), r1=95(y1), r2=161(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 95
LDI r2, 161
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
