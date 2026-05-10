; DESCRIPTION: Places a yellow line segment connecting (107, 85) to (507, 200).
; PLAN: r0=107(x1), r1=85(y1), r2=507(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 85
LDI r2, 507
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
