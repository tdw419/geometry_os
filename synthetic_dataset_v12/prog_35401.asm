; DESCRIPTION: Places a red line segment connecting (401, 132) to (153, 227).
; PLAN: r0=401(x1), r1=132(y1), r2=153(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 132
LDI r2, 153
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
