; DESCRIPTION: Places a red line segment connecting (132, 47) to (139, 224).
; PLAN: r0=132(x1), r1=47(y1), r2=139(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 47
LDI r2, 139
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
