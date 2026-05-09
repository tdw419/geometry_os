; DESCRIPTION: Places a red line segment connecting (166, 122) to (20, 241).
; PLAN: r0=166(x1), r1=122(y1), r2=20(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 122
LDI r2, 20
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
