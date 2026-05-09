; DESCRIPTION: Places a yellow line segment connecting (39, 56) to (15, 161).
; PLAN: r0=39(x1), r1=56(y1), r2=15(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 56
LDI r2, 15
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
