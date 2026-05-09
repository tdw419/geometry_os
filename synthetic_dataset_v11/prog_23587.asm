; DESCRIPTION: Places a yellow line segment connecting (193, 151) to (78, 25).
; PLAN: r0=193(x1), r1=151(y1), r2=78(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 151
LDI r2, 78
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
