; DESCRIPTION: Places a red line segment connecting (410, 53) to (141, 109).
; PLAN: r0=410(x1), r1=53(y1), r2=141(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 53
LDI r2, 141
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
