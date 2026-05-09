; DESCRIPTION: Places a orange line segment connecting (338, 231) to (368, 131).
; PLAN: r0=338(x1), r1=231(y1), r2=368(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 231
LDI r2, 368
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
