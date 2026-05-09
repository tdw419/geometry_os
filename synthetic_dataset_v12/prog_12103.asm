; DESCRIPTION: Places a red line segment connecting (129, 139) to (240, 160).
; PLAN: r0=129(x1), r1=139(y1), r2=240(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 139
LDI r2, 240
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
