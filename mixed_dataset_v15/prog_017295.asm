; DESCRIPTION: Places a black line segment connecting (467, 56) to (304, 54).
; PLAN: r0=467(x1), r1=56(y1), r2=304(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 56
LDI r2, 304
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
