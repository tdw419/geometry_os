; DESCRIPTION: Places a red line segment connecting (62, 38) to (9, 182).
; PLAN: r0=62(x1), r1=38(y1), r2=9(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 38
LDI r2, 9
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
