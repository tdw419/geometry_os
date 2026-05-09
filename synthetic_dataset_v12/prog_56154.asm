; DESCRIPTION: Places a red line segment connecting (501, 154) to (273, 40).
; PLAN: r0=501(x1), r1=154(y1), r2=273(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 154
LDI r2, 273
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
