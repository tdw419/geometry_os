; DESCRIPTION: Places a green line segment connecting (43, 127) to (89, 15).
; PLAN: r0=43(x1), r1=127(y1), r2=89(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 127
LDI r2, 89
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
