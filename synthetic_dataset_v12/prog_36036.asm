; DESCRIPTION: Places a red line segment connecting (457, 125) to (231, 241).
; PLAN: r0=457(x1), r1=125(y1), r2=231(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 125
LDI r2, 231
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
