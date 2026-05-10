; DESCRIPTION: Places a red line segment connecting (333, 25) to (259, 62).
; PLAN: r0=333(x1), r1=25(y1), r2=259(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 25
LDI r2, 259
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
