; DESCRIPTION: Places a green line segment connecting (508, 55) to (119, 117).
; PLAN: r0=508(x1), r1=55(y1), r2=119(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 55
LDI r2, 119
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
