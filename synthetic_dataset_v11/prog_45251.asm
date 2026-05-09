; DESCRIPTION: Places a red line segment connecting (61, 138) to (13, 98).
; PLAN: r0=61(x1), r1=138(y1), r2=13(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 138
LDI r2, 13
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
