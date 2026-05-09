; DESCRIPTION: Places a green line segment connecting (419, 184) to (30, 159).
; PLAN: r0=419(x1), r1=184(y1), r2=30(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 184
LDI r2, 30
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
