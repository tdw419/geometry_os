; DESCRIPTION: Places a red line segment connecting (82, 222) to (62, 23).
; PLAN: r0=82(x1), r1=222(y1), r2=62(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 222
LDI r2, 62
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
