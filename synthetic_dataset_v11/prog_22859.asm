; DESCRIPTION: Places a red line segment connecting (238, 214) to (138, 227).
; PLAN: r0=238(x1), r1=214(y1), r2=138(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 214
LDI r2, 138
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
