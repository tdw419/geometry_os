; DESCRIPTION: Places a red line segment connecting (457, 60) to (294, 238).
; PLAN: r0=457(x1), r1=60(y1), r2=294(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 60
LDI r2, 294
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
