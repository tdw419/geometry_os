; DESCRIPTION: Places a red line segment connecting (164, 21) to (131, 160).
; PLAN: r0=164(x1), r1=21(y1), r2=131(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 21
LDI r2, 131
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
