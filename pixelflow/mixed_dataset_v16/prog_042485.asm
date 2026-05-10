; DESCRIPTION: Places a orange line segment connecting (466, 57) to (192, 48).
; PLAN: r0=466(x1), r1=57(y1), r2=192(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 57
LDI r2, 192
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
