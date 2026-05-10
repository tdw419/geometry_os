; DESCRIPTION: Places a yellow line segment connecting (410, 89) to (31, 33).
; PLAN: r0=410(x1), r1=89(y1), r2=31(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 89
LDI r2, 31
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
