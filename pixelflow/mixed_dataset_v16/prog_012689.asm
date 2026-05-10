; DESCRIPTION: Places a green line segment connecting (471, 44) to (44, 36).
; PLAN: r0=471(x1), r1=44(y1), r2=44(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 44
LDI r2, 44
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
