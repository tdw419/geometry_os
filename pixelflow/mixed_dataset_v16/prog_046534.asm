; DESCRIPTION: Places a red line segment connecting (102, 21) to (306, 241).
; PLAN: r0=102(x1), r1=21(y1), r2=306(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 21
LDI r2, 306
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
