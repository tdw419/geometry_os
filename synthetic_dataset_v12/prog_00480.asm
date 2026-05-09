; DESCRIPTION: Places a green line segment connecting (461, 169) to (176, 1).
; PLAN: r0=461(x1), r1=169(y1), r2=176(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 169
LDI r2, 176
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
