; DESCRIPTION: Places a white line segment connecting (39, 4) to (93, 61).
; PLAN: r0=39(x1), r1=4(y1), r2=93(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 4
LDI r2, 93
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
