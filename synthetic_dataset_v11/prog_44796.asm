; DESCRIPTION: Places a red line segment connecting (120, 191) to (190, 165).
; PLAN: r0=120(x1), r1=191(y1), r2=190(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 191
LDI r2, 190
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
