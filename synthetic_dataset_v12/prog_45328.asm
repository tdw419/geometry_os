; DESCRIPTION: Places a black line segment connecting (467, 66) to (25, 247).
; PLAN: r0=467(x1), r1=66(y1), r2=25(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 66
LDI r2, 25
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
