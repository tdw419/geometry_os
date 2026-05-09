; DESCRIPTION: Places a red line segment connecting (99, 115) to (81, 64).
; PLAN: r0=99(x1), r1=115(y1), r2=81(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 115
LDI r2, 81
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
