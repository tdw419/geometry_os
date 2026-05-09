; DESCRIPTION: Places a red line segment connecting (214, 31) to (498, 35).
; PLAN: r0=214(x1), r1=31(y1), r2=498(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 31
LDI r2, 498
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
