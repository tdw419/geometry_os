; DESCRIPTION: Places a yellow line segment connecting (474, 119) to (410, 11).
; PLAN: r0=474(x1), r1=119(y1), r2=410(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 119
LDI r2, 410
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
