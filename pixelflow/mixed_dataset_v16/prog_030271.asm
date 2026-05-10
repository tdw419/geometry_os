; DESCRIPTION: Places a white line segment connecting (483, 77) to (30, 55).
; PLAN: r0=483(x1), r1=77(y1), r2=30(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 77
LDI r2, 30
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
