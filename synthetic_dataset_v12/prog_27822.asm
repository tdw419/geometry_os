; DESCRIPTION: Places a red line segment connecting (115, 7) to (304, 114).
; PLAN: r0=115(x1), r1=7(y1), r2=304(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 7
LDI r2, 304
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
