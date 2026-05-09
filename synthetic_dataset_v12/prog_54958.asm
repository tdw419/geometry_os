; DESCRIPTION: Places a green line segment connecting (200, 220) to (194, 212).
; PLAN: r0=200(x1), r1=220(y1), r2=194(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 220
LDI r2, 194
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
