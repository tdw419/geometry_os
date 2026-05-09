; DESCRIPTION: Places a red line segment connecting (370, 193) to (182, 241).
; PLAN: r0=370(x1), r1=193(y1), r2=182(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 193
LDI r2, 182
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
