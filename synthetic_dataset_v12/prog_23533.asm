; DESCRIPTION: Places a red line segment connecting (25, 225) to (407, 139).
; PLAN: r0=25(x1), r1=225(y1), r2=407(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 225
LDI r2, 407
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
