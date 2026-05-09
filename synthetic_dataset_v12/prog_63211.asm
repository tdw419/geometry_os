; DESCRIPTION: Places a red line segment connecting (184, 198) to (161, 190).
; PLAN: r0=184(x1), r1=198(y1), r2=161(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 198
LDI r2, 161
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
