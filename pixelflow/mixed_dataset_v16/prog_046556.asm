; DESCRIPTION: Places a red line segment connecting (401, 114) to (34, 184).
; PLAN: r0=401(x1), r1=114(y1), r2=34(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 114
LDI r2, 34
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
