; DESCRIPTION: Places a red line segment connecting (453, 192) to (305, 163).
; PLAN: r0=453(x1), r1=192(y1), r2=305(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 192
LDI r2, 305
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
