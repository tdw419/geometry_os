; DESCRIPTION: Places a green line segment connecting (90, 4) to (141, 34).
; PLAN: r0=90(x1), r1=4(y1), r2=141(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 4
LDI r2, 141
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
