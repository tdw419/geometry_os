; DESCRIPTION: Places a red line segment connecting (503, 162) to (258, 248).
; PLAN: r0=503(x1), r1=162(y1), r2=258(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 162
LDI r2, 258
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
