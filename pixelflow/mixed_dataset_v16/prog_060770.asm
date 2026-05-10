; DESCRIPTION: Places a yellow line segment connecting (39, 99) to (430, 60).
; PLAN: r0=39(x1), r1=99(y1), r2=430(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 99
LDI r2, 430
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
