; DESCRIPTION: Places a green line segment connecting (52, 60) to (500, 105).
; PLAN: r0=52(x1), r1=60(y1), r2=500(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 60
LDI r2, 500
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
