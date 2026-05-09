; DESCRIPTION: Places a white line segment connecting (194, 238) to (76, 193).
; PLAN: r0=194(x1), r1=238(y1), r2=76(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 238
LDI r2, 76
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
