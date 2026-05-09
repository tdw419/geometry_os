; DESCRIPTION: Places a red line segment connecting (238, 216) to (27, 76).
; PLAN: r0=238(x1), r1=216(y1), r2=27(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 216
LDI r2, 27
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
