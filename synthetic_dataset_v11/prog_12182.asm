; DESCRIPTION: Places a white line segment connecting (149, 53) to (214, 193).
; PLAN: r0=149(x1), r1=53(y1), r2=214(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 53
LDI r2, 214
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
