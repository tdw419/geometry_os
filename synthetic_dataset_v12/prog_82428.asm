; DESCRIPTION: Places a red line segment connecting (273, 43) to (344, 223).
; PLAN: r0=273(x1), r1=43(y1), r2=344(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 43
LDI r2, 344
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
