; DESCRIPTION: Places a white line segment connecting (394, 119) to (484, 13).
; PLAN: r0=394(x1), r1=119(y1), r2=484(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 119
LDI r2, 484
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
