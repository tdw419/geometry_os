; DESCRIPTION: Places a red line segment connecting (31, 98) to (58, 26).
; PLAN: r0=31(x1), r1=98(y1), r2=58(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 98
LDI r2, 58
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
