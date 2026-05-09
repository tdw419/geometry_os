; DESCRIPTION: Places a green line segment connecting (435, 52) to (378, 120).
; PLAN: r0=435(x1), r1=52(y1), r2=378(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 52
LDI r2, 378
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
