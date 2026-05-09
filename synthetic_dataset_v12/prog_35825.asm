; DESCRIPTION: Places a red line segment connecting (418, 163) to (428, 32).
; PLAN: r0=418(x1), r1=163(y1), r2=428(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 163
LDI r2, 428
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
