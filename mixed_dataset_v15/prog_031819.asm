; DESCRIPTION: Places a white line segment connecting (347, 212) to (252, 168).
; PLAN: r0=347(x1), r1=212(y1), r2=252(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 212
LDI r2, 252
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
