; DESCRIPTION: Places a orange line segment connecting (272, 131) to (222, 173).
; PLAN: r0=272(x1), r1=131(y1), r2=222(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 131
LDI r2, 222
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
