; DESCRIPTION: Places a red line segment connecting (478, 214) to (100, 243).
; PLAN: r0=478(x1), r1=214(y1), r2=100(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 214
LDI r2, 100
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
