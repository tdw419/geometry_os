; DESCRIPTION: Places a red line segment connecting (145, 114) to (388, 5).
; PLAN: r0=145(x1), r1=114(y1), r2=388(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 114
LDI r2, 388
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
