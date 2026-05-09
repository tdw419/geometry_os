; DESCRIPTION: Places a green line segment connecting (120, 16) to (149, 119).
; PLAN: r0=120(x1), r1=16(y1), r2=149(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 16
LDI r2, 149
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
