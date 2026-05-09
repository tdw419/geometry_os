; DESCRIPTION: Places a red line segment connecting (93, 114) to (57, 248).
; PLAN: r0=93(x1), r1=114(y1), r2=57(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 114
LDI r2, 57
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
