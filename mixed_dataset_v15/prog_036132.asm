; DESCRIPTION: Places a red line segment connecting (478, 135) to (11, 121).
; PLAN: r0=478(x1), r1=135(y1), r2=11(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 135
LDI r2, 11
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
