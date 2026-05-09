; DESCRIPTION: Places a green line segment connecting (325, 11) to (118, 65).
; PLAN: r0=325(x1), r1=11(y1), r2=118(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 11
LDI r2, 118
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
