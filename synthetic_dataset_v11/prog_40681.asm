; DESCRIPTION: Places a red line segment connecting (140, 54) to (238, 126).
; PLAN: r0=140(x1), r1=54(y1), r2=238(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 54
LDI r2, 238
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
