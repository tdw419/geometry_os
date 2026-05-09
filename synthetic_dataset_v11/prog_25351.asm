; DESCRIPTION: Places a red line segment connecting (21, 229) to (0, 199).
; PLAN: r0=21(x1), r1=229(y1), r2=0(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 229
LDI r2, 0
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
