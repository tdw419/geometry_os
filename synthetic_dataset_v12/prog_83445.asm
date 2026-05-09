; DESCRIPTION: Places a green line segment connecting (131, 80) to (149, 180).
; PLAN: r0=131(x1), r1=80(y1), r2=149(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 80
LDI r2, 149
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
