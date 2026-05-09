; DESCRIPTION: Places a red line segment connecting (101, 244) to (449, 59).
; PLAN: r0=101(x1), r1=244(y1), r2=449(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 244
LDI r2, 449
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
