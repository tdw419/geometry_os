; DESCRIPTION: Places a yellow line segment connecting (200, 90) to (212, 195).
; PLAN: r0=200(x1), r1=90(y1), r2=212(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 90
LDI r2, 212
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
