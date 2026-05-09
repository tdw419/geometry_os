; DESCRIPTION: Places a red line segment connecting (456, 158) to (168, 10).
; PLAN: r0=456(x1), r1=158(y1), r2=168(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 158
LDI r2, 168
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
