; DESCRIPTION: Places a red line segment connecting (163, 245) to (52, 38).
; PLAN: r0=163(x1), r1=245(y1), r2=52(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 245
LDI r2, 52
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
